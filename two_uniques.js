//Get the xor value from the arr
//get all combinations for the xor, 
//For each combination, use one as the starting value and check if you get the other one,
//If so, return the combination,
//If you reach the end of the possible combinations, this should never happen, return - 1.
function twoUniques(arr) { 
    const numbers = testCombinations(arr, convert(getXor(arr), 2, []));
    return numbers;

    function convert(val, base = 2, arr = []) {
        if (val === 0) return arr
        arr.unshift(val%base)
        return convert(Math.floor(val/2), base, arr)
    }

    function decimal(arr) { 
        let sum = 0
        let i = 0
        while (i < arr.length) {
            sum += arr[i] * (2**(arr.length - i - 1))
            i++;
        }
        return sum
    }

    function standardizeLength(arr, length=10) {
        //Return new arr 
        const newArr = [];
        let i = 0;
        while (newArr.length < arr.length) {
            newArr.push(arr[i])
            i++;
        }
        while (newArr.length < length) {
            newArr.unshift(0);
        }
        return newArr;
    }

    function getXor(arr, startingValue = 0) { 
        return arr.reduce((acc, el) => acc ^ el, startingValue)
    }

    function testCombinations(arr, xor) {
        normalizedXor = standardizeLength(xor, 10);
        //Return combination that is correct. 
        return permutations(arr, normalizedXor, normalizedXor.length)
    }

    function count(arr, val) { 
        let count = 0 
        let i = 0
        while (i < arr.length) { 
            if (arr[i] === val) { count ++; }
            i++;
        }
        return count;
    }

    function permutations(arr, xor, length=10) {
        const queue = [[0,0],[0,1],[1,0],[1,1]];
        let startingValue;
        let complement;
        while (queue[queue.length - 1].length <= length) {
            queue.unshift([1].concat(startingValue))
            queue.unshift([0].concat(startingValue))
            startingValue = queue.pop()
            if (startingValue.length > 2 && startingValue[0] === 0) continue;
            complement = decimal(startingValue) ^ decimal(xor)
            if (count(arr, complement) === 1) {
                return [decimal(startingValue), complement]
            } 
        }
        return -1;
    }
}

//How to handle variable number of BIT size, for any number? set every to a max 10 bits long. 
console.log(twoUniques([1,1,2,2,3,3,4,4,5,5,6,7]))
console.log(twoUniques([9,1,1,2,2,3,3,8,4,4,5,5]))
console.log(twoUniques([4,4,6,6,2,1,3,3,9,9,0,0]))