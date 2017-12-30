function rotateSquare(matrix) {
  //Constant space?
  //do the iterations for now.
  let length = matrix.length-1;
  let midpoint = Math.floor((length-1)/2);
  let j = 0;

  let tempIndex;
  let tempVal1;
  let tempVal2;

  for(let i = 0; i<=midpoint; i++) {
    for (let j = i; j< matrix.length-1-i; j++) {
      //Do the swapping (four times);
      console.log(matrix[i][j]);

      tempVal1 = matrix[i][j];
      [matrix[j][length-i],tempVal1] = [tempVal1, matrix[j][length-i]];
      [matrix[length-i][length-j],tempVal1] = [tempVal1, matrix[length-i][length-j]];
      [matrix[length-j][i],tempVal1] = [tempVal1, matrix[length-j][i]];
      [matrix[i][j],tempVal1] = [tempVal1, matrix[i][j]];
    }
  }


  return matrix;
  // //Not constant space, O(n?) time complexity.
  // const new_matrix = [];
  // let row;
  // for (let x = 0; x < matrix.length; x ++) {
  //   row = [];
  //   for (let y = matrix.length-1; y>=0; y--) {
  //       row.push(matrix[y][x]);
  //   }
  //   new_matrix.push(row);
  // }
  //
  // return new_matrix;
}

console.log(rotateSquare([[1,2],[3,4]]));
console.log(rotateSquare([[1,2,3],[4,5,6],[7,8,9]]));
console.log(rotateSquare([[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]));
console.log(rotateSquare([[1,2,3,4,5],[6,7,8,9,10],[11,12,13,14,15],[16,17,18,19,20],[21,22,23,24,25]]));
