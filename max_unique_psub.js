// find the largest lexographically scoped psub.
//
// max_unique_psub('abcdef')
// => 'f'
// max_unique_psub('abcdefedcba')
// => 'fedcba'
//
// max_unique_psub('algorithms')
// a lg o ri ts

//Start with the first letter, if the currnet letter is greater than the first,
//Replace the whole string with the current letter. If the current letter is
//greater than the previous letter, but not the first letter, replace the previous
//letter

// => 'ts'

// o(n) time how to do this.

// The longest string that that goes backward, and doesn't have to be contiguous.
//

function max_unique_psub(str) {
  let result = [str[0]];
  // debugger;
  for (let i = 1; i < str.length; i++) {
    if (str[i] > result[0] ) {
      result = [str[i]]
    } else if (str[i] > result[result.length-1]) {
      result[result.length-1] = str[i];
    } else {
      result.push(str[i]);
    }
  }

  return result.join('');
}

// In all three examples, the answer's first letter is the largest in the string.
// In all three example, the letters after the first letter are in descending order.


console.log(max_unique_psub('abcdef'));
console.log(max_unique_psub('abcdefedcba'));
console.log(max_unique_psub('algorithms'));
