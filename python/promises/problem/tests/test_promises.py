"""Contains tests for the Promise class."""

import datetime
from functools import partial
import time
import unittest
from promises.promise import Promise


class TestPromise(unittest.TestCase):
    """TestPromise contains helper methods for all the test cases below."""

    def sleep_handler(self, n, state, resolve, reject):
        time.sleep(n)

        if state == 'fulfilled':
            resolve(n)
        else:
            reject(n)

    def check_promise(self, state, val, expected_time_to_resolve, promise_func):
        """
        Test various aspects of promise methods.

        Args:
            state: The expected state of the promise ('fulfilled' or 'rejected')
            val: The expected value of the resolved promise.
            expected_time_to_resolve: How long the operation is expected to take before it resolves.
            promise_func: A function that returns a promise with the operation we're trying to test, like `then` or
                `catch`.
        """
        start_time = datetime.datetime.now()
        promise = promise_func()

        # Is the return value a Promise?
        self.assertIs(type(promise), Promise)

        time_to_return_to_main_thread = (datetime.datetime.now() - start_time).total_seconds()
        time_to_resolve = 0
        while promise.state == 'pending' and time_to_resolve < expected_time_to_resolve:
            time_to_resolve = (datetime.datetime.now() - start_time).total_seconds()

        # Did the promise return to the main thread immediately?
        self.assertLess(time_to_return_to_main_thread, 0.2)

        # Did the promise get its state set correctly?
        self.assertEqual(promise.state, state)

        # Did the promise get its value set correctly?
        if isinstance(val, Exception):
            self.assertIsInstance(promise.val, Exception)
            self.assertEqual(str(val), str(promise.val))
        else:
            self.assertEqual(promise.val, val)

        # Did the promise resolve in the correct timeframe?
        self.assertLess(time_to_resolve, expected_time_to_resolve)


class TestPromiseAll(TestPromise):
    """TestPromiseAll tests the Promise.all() method on the class."""

    def test_that_it_waits_for_all_to_be_fulfilled(self):
        vals = [2, 5, 3]
        executors = [partial(self.sleep_handler, n, 'fulfilled') for n in vals]

        self.check_promise('fulfilled',
                           vals,
                           5.2,
                           lambda: Promise.all([Promise(executor) for executor in executors]))

    def test_that_it_returns_after_the_first_rejection(self):
        vals = [2, 5, 3]
        executors = [partial(self.sleep_handler, n, 'rejected') for n in vals]

        self.check_promise('rejected',
                           2,
                           2.2,
                           lambda: Promise.all([Promise(executor) for executor in executors]))


class TestPromiseRace(TestPromise):
    """TestPromiseRace tests the Promise.race() method on the class."""

    def test_that_it_returns_after_the_first_fulfillment(self):
        vals = [2, 5, 3]
        executors = [partial(self.sleep_handler, n, 'fulfilled') for n in vals]

        self.check_promise('fulfilled',
                           2,
                           2.2,
                           lambda: Promise.race([Promise(executor) for executor in executors]))

    def test_that_it_returns_after_the_first_rejection(self):
        vals = [2, 5, 3]
        executors = [partial(self.sleep_handler, n, 'rejected') for n in vals]

        self.check_promise('rejected',
                           2,
                           2.2,
                           lambda: Promise.race([Promise(executor) for executor in executors]))


class TestPromiseResolve(TestPromise):
    """TestPromiseResolve tests the Promise.resolve() method on the class."""

    def test_that_it_creates_a_fulfilled_promise(self):
        val = 'hi'
        self.check_promise('fulfilled', val, 0.2, lambda: Promise.resolve(val))


class TestPromiseReject(TestPromise):
    """TestPromiseReject tests the Promise.reject() method on the class."""

    def test_that_it_creates_a_rejected_promise(self):
        reason = 'something was wrong before we started'
        self.check_promise('rejected', reason, 0.2, lambda: Promise.reject(reason))


class TestPromiseInstance(TestPromise):
    """
    TestPromise contains helper methods for all the test cases below.

    It strictly handles instance methods.
    """

    def sleep_and_panic(self, n):
        time.sleep(n)
        raise RuntimeError('ack!')

    def sleep_and_return(self, n):
        time.sleep(n)
        return n


class TestPromiseThen(TestPromiseInstance):
    """TestPromiseThen tests the Promise.then() method."""

    def __do_nothing(self):
        pass

    def __get_promise_with_then(self, should_panic, n, state):
        """
        Chain promises together with .then.

        Args:
            should_panic: A boolean indicating whether the function passed into then() should raise an error.
            n: The number of seconds for each promise to sleep.
            state: The original promise's state ('fulfilled' or 'rejected')

        Returns:
            A Promise.
        """
        handler = self.sleep_and_return
        if should_panic:
            handler = self.sleep_and_panic

        promise = Promise(partial(self.sleep_handler, n, state))

        if state == 'fulfilled':
            return promise.then(lambda n: handler(n))
        else:
            return promise.then(lambda _: self.__do_nothing(), lambda n: handler(n))

    def test_that_it_resolves_correctly_when_the_original_was_fulfilled(self):
        n = 2
        self.check_promise('fulfilled',
                           n,
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_then, False, n, 'fulfilled'))

    def test_that_it_resolves_correctly_when_the_original_was_rejected(self):
        n = 2
        self.check_promise('fulfilled',
                           n,
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_then, False, n, 'rejected'))

    def test_that_it_rejects_correctly_when_the_original_was_fulfilled(self):
        n = 2
        self.check_promise('rejected',
                           RuntimeError('ack!'),
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_then, True, n, 'fulfilled'))

    def test_that_it_rejects_correctly_when_the_original_was_rejected(self):
        n = 2
        self.check_promise('rejected',
                           RuntimeError('ack!'),
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_then, True, n, 'rejected'))


class TestPromiseCatch(TestPromiseInstance):
    """TestPromiseCatch tests the Promise.catch() method."""

    def __get_promise_with_catch(self, should_panic, n):
        """
        Chain promises together with .catch.

        Args:
            should_panic: A boolean indicating whether the function passed into catch() should raise an error.
            n: The number of seconds for each promise to sleep.

        Returns:
            A Promise.
        """
        handler = self.sleep_and_return
        if should_panic:
            handler = self.sleep_and_panic

        return Promise(
            partial(self.sleep_handler, n, 'rejected')
        ).catch(
            lambda n: handler(n)
        )

    def test_that_it_resolves_correctly(self):
        n = 2
        self.check_promise('fulfilled',
                           n,
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_catch, False, n))

    def test_that_it_rejects_correctly(self):
        n = 2
        self.check_promise('rejected',
                           RuntimeError('ack!'),
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_catch, True, n))


class TestPromisePFinally(TestPromiseInstance):
    """TestPromisePFinally tests the Promise.p_finally() method."""

    def __get_promise_with_p_finally(self, n, msg, obj):
        """
        Chain promises together with .catch and .p_finally.

        Args:
            n: The number of seconds for each promise to sleep.
            msg: The message to insert into the object.
            obj: A dict which will be updated if this test is successful.

        Returns:
            A Promise.
        """
        return Promise(
            partial(self.sleep_handler, n, 'rejected')
        ).catch(
            lambda n: self.sleep_and_return(n)
        ).p_finally(
            lambda: obj.update({'finally': msg})
        )

    def test_that_it_calls_the_function_at_the_end(self):
        obj = {}
        msg = 'we did it'
        n = 2
        self.check_promise('fulfilled',
                           n,
                           (2 * n) + 0.2,
                           partial(self.__get_promise_with_p_finally, n, msg, obj))
        # Give it a bit of time to process the final callback.
        time.sleep(0.1)
        self.assertEqual(obj.get('finally'), msg)

if __name__ == '__main__':
    unittest.main()
