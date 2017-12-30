function groupingDishes(dishes) {
    let hash = {};
    let result = [];

    for (let i = 0; i<dishes.length; i++) {
        for (let j = 1; j<dishes[i].length; j++) {
            if (!hash[dishes[i][j]]) {
                hash[dishes[i][j]] = [];
            }
        }
    }

    for (let i = 0; i<dishes.length; i++) {
        for (let j = 1; j<dishes[i].length; j++) {
            hash[dishes[i][j]].push(dishes[i][0])
        }
    }

    Object.keys(hash).sort().forEach((key) => {
       if (hash[key].length > 1) {
           hash[key] = hash[key].sort()
           hash[key].unshift(key);
           result.push(hash[key]);
       }
    });

    console.log(hash)
    return result;
}
