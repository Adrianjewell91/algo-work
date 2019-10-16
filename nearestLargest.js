function nearestLargest(arr) {
  const result = [];
  const stack = [];

  let poppedElement;
  let competingDifference;

  const poppedElements = [];

  let i = 0;
  while (i < arr.length) {

    while (stack.length > 0 && stack[stack.length-1][0] < arr[i]) {
      //this part requires the popping of elements until
      //the next element !== the current popped element.
      // if (stack.length > 1) {
      //   poppedElements.push(stack.pop());
      //   while (stack.length > 0 &&
      //          poppedElements[0][0] === stack[stack.length-1][0]) {
      //     poppedElements.push(stack.pop());
      //   }
      // } else {
      //   poppedElements.push(stack.pop());
      // }
      //build an array of popped elements that are unique.
      //the pop them off one at a time, making the comparison with the current
      // and the top of the stack.
      // while (poppedElements.length > 0) {
      poppedElement = stack.pop();
        if (stack.length > 0) {
          competingDifference = Math.abs(poppedElement[1]-stack[stack.length-1][1]);
          result[poppedElement[1]] = competingDifference <= Math.abs(i - poppedElement[1]) ? stack[stack.length-1][1] : i;
        } else {
          result[poppedElement[1]] = i;
        }
      // }
    }

    if (arr[i-1] > arr[i] && i !== -1) {
      result[i] = (i-1);
    } else if (arr[i+1] > arr[i] && i !== arr.length) {
      result[i] = i+1;
    } else if (arr[i-1] > arr[i] || arr[i+1] > arr[i]) {
      result[i] = arr[i-1] > arr[i] ? i - 1 : i + 1;
    } else {
      stack.push([arr[i],i]);
    }

    i+=1;
  }

  //how to handle repeated numbers
  // const repeatedElements = [];
  // debugger
  //this doesn't handle all cases. only when the stack is two long.
  // if it's longer, we want perform the other code. 
  while (stack.length > 1) {
    // debugger
    // while (stack[stack.length-1][0] === stack[stack.length-2][0]) {
    //   repeatedElements.push(stack.pop())
    // }
    // repeatedElements.push(stack.pop())
    // debugger
    // while (repeatedElements.length > 0) {
    let el = stack.pop();
    // while (stack.)
    i=arr.length-2;
    while(i>0) {
      if(arr[i] > el[0]){
        result[el[1]] = i;
        break;
      }
      i -= 1;
    }
    if (i===0) { result[el[1]] = -1; }
    // }
  }

  if (stack.length === 1) {
    const last = stack.pop();
    result[last[1]] = -1;
  }

  return [result, stack];
}

// The pseudo code.
// iterate through the array, and do some things:
// If the stack is empty, move onto checking both sides of the index.
// If the stack is not empty, check if the current index is greater than the number,
//if it is greater, then do the checks:
// At this point, pop off an element of the stack and compare the difference between current and stack value's index,
//  and the differnece between it and a stack value underneath, push in the popped element's index, the index that yields the lowest differenec.
// at the end, handle the remaining elements in the stack, which include handling
//an array of until the next number is larger, and then assigning the indices, in
// the array, the value at the next largest number.
// If there is one element left in the stack, then that index, get's assigned -1.
// When the stack is empty.
//It does't handle strings of repeated #s at the end. It handles repeats in the middle.
