function first_repeat(arr) {
  debugger
  var last = arr[arr.length-1]
  i = 1
  while (i < arr.length) {
    last = arr[last -1];
    i+=1;
  }

  let repeat = arr[last-1];
  let count = 1;
  while (repeat !== last) {
    repeat = arr[repeat-1];
    count+=1;
  }

  let first = arr[arr.length-1]
  let second = arr[arr.length-1]
  while (count > 0) {
    first = arr[first-1];
    count-=1;
  }

  while (first !== second) {
    first = arr[first-1];
    second = arr[second-1];
  }

  return first;
}

//[3,1,2,4,3,1,6,7]
//first = 1
//second = 1
//count = 0

function combinations(arr) {
  let result = [[]];
  let newResult = [];
  for (let i = 0; i< arr.length; i++) {

    for (let j = 0; j < result.length; j++) {

      for (let k = 0; k < arr[i].length; k++) {

        newResult.push(result[j].concat(arr[i][k]))
      
      }
    }

    result = newResult  
    newResult = [] 

  }

  return result 
}