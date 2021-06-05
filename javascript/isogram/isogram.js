/**
 *  An isogram is a word or phrase spelled without using any letters more than once.
 *
 *  Examples of isograms:
 *   - lumberjacks
 *   - background
 *   - downstream
 *   - the dog barks
 *
 *  Not isograms:
 *   - abba
 *   - eggs benedict
 *
 *  Implement a function to test if a given input is an isogram.
 */


function isIsogram(input) {
  // Implement this!
}


/**
 * Test cases
 */
console.assert(isIsogram('lumberjacks'), `Expected isIsogram('lumberjacks') => true`);

console.assert(!isIsogram('sandwiches'), `Expected isIsogram('sandwiches') => false`);

console.assert(!isIsogram('éléphant'), `Expected isIsogram('éléphant') => false`);

console.assert(isIsogram('Emily Jung Schwartzkopf'), `Expected isIsogram('Emily Jung Schwartzkopf') => true`);

console.log('Success!')
