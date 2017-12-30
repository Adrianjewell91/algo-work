function highestProduct(arr) {
  if (arr.length < 3) {return "Need three numbers";}

  let highest = [arr[0], arr[1]].reduce((a,b) => Math.max(a,b));
  let lowest = [arr[0], arr[1]].reduce((a,b) => Math.min(a,b));

  let highestProductOfTwo = arr[0] * arr[1];
  let lowestProductOfTwo = arr[0] * arr[1];

  let highestProductOfThree = arr[0] * arr[1] * arr[2];

  for (let i = 2; i<arr.length; i++) {

    highestProductOfThree = [highestProductOfThree,
      arr[i] * highestProductOfTwo,
      arr[i] * lowestProductOfTwo].reduce((a,b) => Math.max(a,b));

    highestProductOfTwo = [highestProductOfTwo,
                           arr[i] * highest,
                           arr[i] * lowest].reduce((a,b) => Math.max(a,b));

    lowestProductOfTwo = [lowestProductOfTwo,
                           arr[i] * highest,
                           arr[i] * lowest].reduce((a,b) => Math.min(a,b));

    highest = [highest, arr[i]].reduce((a,b) => Math.max(a,b));
    lowest = [lowest, arr[i]].reduce((a,b) => Math.min(a,b));
  }

  return highestProductOfThree;
  //do this in javascript. Yes, it can be done.
  //O(n) time complexity.
  //sort them then either take the
  //[1,-3,0,8,30,2,-6]
  //h 30
  //l -6
  //h2 240
  //l2 0
  //h3 580
}
