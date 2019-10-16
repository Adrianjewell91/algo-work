//Implement a the grouping algorithm in here, and also find a way to skip 
//branches, which this permits I think.

function permutations(arr, k) {
    const res = [];
    const hash = [];
    const buffer = []; // or allocate the length of the array.
    dfs(res, arr, hash, k, buffer);
    return res;
}

function dfs(res = [], arr = [], hash = [], k = 1, buffer = []) {
    if (buffer.length === k) {
        //build new array and push it in
        let n = [] 
        buffer.forEach(el => n.push(el))
        res.push(n); 
        return;
    }
    let i = 0
    while ( i < arr.length ) {
        if (!hash[i]) {
            hash[i] = true 
            buffer.push(arr[i])
            dfs(res, arr, hash, k, buffer);
            hash[i] = undefined;
            buffer.pop()
        }
        i++;
    }
}

console.log(permutations([1,2,3,4,5], 5))
console.log(permutations([1,2,3,4,5], 5).length)


