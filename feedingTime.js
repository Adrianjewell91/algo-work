//My backtracking is working but it's not 100percent correct. 
//how what would you know but in a year quantum computers will do it just fine.

function feedingTime(arr) {
    const graph = b(arr);
    return f(graph);
}

function b(arr) {
    let a = [];
    let i = 0;
    let j = 0;
    while (i < arr.length) {
        j = 0;
        a.push([])
        while (j < arr.length) {
            if (i === j) { j++; continue; }
            else if (g(arr[i], arr[j])) { a[a.length - 1].push(j); }
            j++;
        }
        i++;
    }
    return a;
}

function g(arr1, arr2) {
    let i = 0;
    while (i < arr2.length) {
        if (arr1.includes(arr2[i])) { return true; }
        i++;
    }
    return false;
}

function h(val1, val2) {
    if (!val2 || !val1) return false;
    else if (val1 === val2) return true;
    return false;
}

function f(graph) {
    const hash = {}
    const colors = ['r', 'g', 'b', 'y', 'v', 'a', 'c', 'd', 'e', 'f', 'g'];
    let max = 0;
    let length;
    const stack = [];
    let depth = 0;
    let i = 0;
    let j = 0;

    console.log(graph)
    while (i < graph.length) {
        if (hash[i]) { i++; continue; }
        stack.unshift(i)
        while (stack.length > 0) {
            console.log(hash)
            j = max;
            while (j >= 0) {
                if (graph[stack[0]].every(node => h(colors[j], hash[node]) === false)) {
                    hash[stack[0]] = colors[j];
                    break;
                }
                j--;
            }
            if (j < 0 && !hash[stack[0]]) {
                //now implement a backtracking that progressively goes back further and furthe
                if (stack.length !== max + 2 + depth) {
                    while (stack.length > max + 2 + depth) {
                        console.log('backtracking:', stack)
                        delete hash[stack[0]]
                        stack.shift()
                    }
                    depth++;
                } else {
                    depth = 0;
                    max++;
                    // if (max > 4) { return -1; }
                    hash[stack[0]] = colors[max];
                }
            }
            j = 0;
            length = graph[stack[0]].length
            while (j < length) {
                if (!hash[graph[stack[0]][j]]) {
                    stack.unshift(graph[stack[0]][j]); // push on the node from the array of the graph node in the question.    
                    break;
                }
                j++;
            }
            if (j === length) {
                stack.shift()
            }
        }
        i++;
    }
    return max + 1;
}


console.log(feedingTime([["aa", "ab", "ac", "ad", "ae", "af", "ag", "ah"],
["aa", "ai", "aj", "ba", "bb", "bc", "bd", "be"],
["bf", "bg", "bh", "bi", "bj", "ca", "cb", "cc"],
["ab", "bf", "cd", "ce", "cf", "cg", "ch", "ci", "cj"],
["ac", "ai", "bg", "da", "db", "dc", "dd", "de", "df", "dg"],
["aj", "cd", "da", "dh", "di", "dj", "ea", "eb", "ec", "ed"],
["ad", "bh", "ee", "ef", "eg", "eh", "ei", "ej", "fa"],
["ba", "bi", "ce", "db", "dh", "ee", "fb", "fc", "fd"],
["ae", "bj", "cf", "ef", "fb", "fe", "ff", "fg", "fh", "fi"],
["bb", "ca", "cg", "dc", "di", "fe", "fj", "ga", "gb"],
["af", "dd", "dj", "eg", "fc", "ff", "gc", "gd", "ge"],
["bc", "cb", "ch", "de", "ea", "eh", "fd", "fg"],
["bd", "cc", "ci", "eb", "ei", "fh", "fj", "gc"],
["ag", "be", "cj", "df", "ec", "ej", "fi", "ga", "gd"],
["ah", "dg", "ed", "fa", "gb", "ge"]]))

// console.log(feedingTime([["Seal", "Muskrat", "Badger"],
// ["Ocelot", "Badger", "Baboon"],
// ["Mink", "Opossum", "Capybara"],
// ["Camel", "Muskrat", "Opossum"],
// ["Moose", "Baboon", "Camel"],
// ["Lizard", "Capybara", "Beaver"]])) 

// console.log(feedingTime([["Coati", "Ram"],
// ["Chameleon", "Buffalo", "Coati"],
// ["Elk", "Coyote", "Jerboa"],
// ["Coyote", "Elk"],
// ["Gorilla", "Chameleon"],
// ["Fawn", "Alpaca", "Coyote"],
// ["Raccoon", "Bear", "Coyote", "Walrus"],
// ["ocelot", "Coyote", "Giraffe"]]))