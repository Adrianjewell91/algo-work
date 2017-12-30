//Callback throttler
function throttle(wait,onLast,onFirst,interval,timeStamps) {
  const result = [];
  let cluster = [];

  function handleCluster() {
      //handle the interval here.
      //if it's on first, result.push(cluster[0] plus intervals until the
      // number is greater than the last number in the cluster.)
      if (onFirst === true) {
        result.push(cluster[0]);

        if (interval > 0) {
          let multiplier = 1;
          do {
            result.push(multiplier * interval)
            multiplier += 1;
          } while (multiplier * interval < cluster[cluster.length-1])
        }

      } else {
        //if it's the end, I'm not sure what to do.
        result.push(cluster[cluster.length-1]+wait);
      }
  }

  timeStamps.forEach((el,idx) => {
    //Iterate through the array;
    //If there' no element, start a cluster.
    // If there are elements, decide what to do next.
      //If the next element can be part of the cluster, then put it in.
      //If the next element cannot be part of the cluster, then push the cluster
          //into result, and reset the cluster.

    //If after iterating, there is cluster left over, handle the cluster.
    if (cluster.length === 0) {
      cluster.push(el);
    } else {

      // do something with the cluster.
      // if the difference between the current and previous <= wait.
      if (el - timeStamps[idx-1] <= wait) {
        //add it to the cluster.
        cluster.push(el);
      } else {
        //if not, handle the cluster relation to result, and reset the cluster.
        handleCluster();
        //reset the cluster;
        // debugger;
        cluster = [el];
      }
    }
  });

  //handle a remainging cluster;
  if (cluster.length !== 0) {
    handleCluster();
  }

  return result;
}

console.log('throttle(20, false, true, 0, [0,10,40])');
console.log(throttle(20, false, true, 0, [0,10,40]));
console.log('throttle(20, true, false, 0, [0,10,20,30]);');
console.log(throttle(20, true, false, 0, [0,10,20,30]));
console.log('throttle(20, false, true,0, [0,10,20,30]);');
console.log(throttle(20, false, true,0, [0,10,20,30]));

//now handle the interval variable, what does it mean? I think it means start
//Do another iteration, but with any timestamps less than the interval
//not included in the next iteration.

// or it means that for a cluster, if there is an interval greater than zero,
//that we fire again on that interval until the time stamp is greater than the
// time stamp in the cluster

//i.e. cluster [0,10,20,30], [0[onFirst],20[interval =20], NOT 40(because we're
//greater than 30 at this point)].

//So interval is taken care of outside the cluster.

//I want to move back to Boston, where my life was really starting to get going.
//From here on out - all Boston for jobs, look to venture capital funding here in
//SF, and go to talks, and get the fucking job ASAP.

console.log(`throttle(20, false, true,20, [0,10,20,30])`);
console.log(throttle(20, false, true,20, [0,10,20,30]));
