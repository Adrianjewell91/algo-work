
window.addEventListener("DOMContentLoaded", function() {
  console.log("loaded");

  let theData;

  let x = d3.csv("./test.csv", function(data) {
    // console.log(data);
    theData = data;
    window.myData = data;
    console.log(theData);
  });
  window.x = x;
});
