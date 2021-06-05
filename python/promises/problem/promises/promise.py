"""
The promise library contains functions to implement promises in Python.

For an overview of promises, see
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
"""

from functools import partial
from threading import Thread


class Promise(object):
    """Represents an asynchronous action."""

    @classmethod
    def resolve(cls, val):
        """
        Get a Promise that is resolved with the given value.

        This function should not do any work.
        """
        pass

    @classmethod
    def reject(cls, reason):
        """
        Get a Promise that is rejected with the given reason.

        This function should not do any work.
        """
        pass

    @classmethod
    def all(cls, promises):
        """
        Return a promise that waits on all the given promises.

        It will wait until all the promises are fulfilled, or return as soon as any promise is rejected.

        Args:
            promises: A list of Promise objects.

        Returns:
            A Promise object.
        """
        pass

    @classmethod
    def race(cls, promises):
        """
        Return a promise that returns the first resolved promise (fulfilled or rejected, doesn't matter).

        Args:
            promises: A list of Promise objects.

        Returns:
            A Promise object.
        """
        pass

    def __resolve(self, val):
        pass

    def __reject(self, val):
        pass

    def __init__(self, executor=None, state='pending', val=None):
        """
        Create a new promise.

        Args:
            executor: A function which takes in two other functions as arguments.
                https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#Parameters
            state: The initial state of the Promise.
            val: The return value of the work that the Promise did.

        Returns:
            A Promise object.
        """
        self.state = state
        self.val = val
        if executor is not None:
            executor(self.__resolve, self.__reject)

    def then(self, on_fulfilled, on_rejected=None):
        """
        Set a callback to run after this promise has been resolved or rejected.

        Args:
            on_fulfilled: A lambda which takes in the value the promise was resolved with.
            on_rejected: A lambda which takes in the value the promise was rejected with.

        Returns:
            A Promise object.
        """
        pass

    def catch(self, on_rejected):
        """
        Set a callback to run after this promise has been rejected.

        Args:
            on_rejected: A lambda which takes in the value the promise was rejected with.

        Returns:
            A Promise object.
        """
        pass

    def p_finally(self, on_finally):
        """
        Set a callback to run after this promise is settled.

        Unfortunately, we can't use the name finally since it is a reserved word in Python.

        Args:
            on_finally: A lambda which takes no arguments.

        Returns:
            A Promise object.
        """
        pass
