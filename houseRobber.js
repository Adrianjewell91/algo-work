function houseRobber(nums) {
  if (nums === undefined || nums.length === 0) {
      return 0;
  }
  let dp = [];
  dp[0] = 0;
  dp[1] = nums[0];
  debugger;
  for (let i = 2;i <= nums.length; i++) {
      dp[i] = Math.max(dp[i-1], nums[i-1] + dp[i-2]);
  }

  return dp[nums.length];
}
//     if (nums.length === 0) {
//       return 0;
//     } else if (nums.length === 1) {
//       return nums[0];
//     }
//
//     let hash = {};
//     // hash[nums[0]] = generate(nums.slice(2));
//     // hash[nums[1]] = generate(nums.slice(3));
//     hash[0] = generate(nums.slice(2),2);
//     hash[1] = generate(nums.slice(3),3);
//
//     let results = [];
//     createArrays(hash);
//
//     function createArrays(hash, current = []) {
//       if (hash === false) {
//         results.push(current);
//       } else {
//         const keys = Object.keys(hash).map((a) => parseInt(a));
//         for (let i = 0; i < keys.length; i++) {
//           createArrays(hash[keys[i]], current.concat(keys[i]));
//         }
//       }
//     }
//     // debugger
//     let max = results[0].reduce((a,b) => a + nums[b],0);
//
//     for (let j = 1; j < results.length; j++) {
//       let test = results[j].reduce((a,b) => a + nums[b],0);
//
//       if (test > max) { max = test; }
//     }
//
//     return max;
// }

//Push indices not values.
// function generate(arr, counter) {
//   if (arr.length === 0) {
//     return false;
//   } else if (arr.length === 1) {
//     // let el = arr[0];
//     let obj = { [counter + 0]: generate([]) };
//     return obj;
//     // return true;
//   } else {
//     let el1 = counter + 0;
//     let el2 = counter + 1;
//     let obj ={
//       [el1]: generate(arr.slice(2),counter+2),
//       [el2]: generate(arr.slice(3),counter+3)
//     };
//     return obj;
//   }
// }
