function hasPathWithGivenSum(t, s) {
    //if there are no children and s === 0 return true
    //
    //else, get the left and right and then check them.
    if (t === null) {
        return false;

    } else if (t.left === null && t.right === null) {
        if (s===0) {
            return true;
        } else {
            return false;
        }
    }

    const left = hasPathWithGivenSum(t.left, s-t.value);
    const right = hasPathWithGivenSum(t.right, s-t.value);

    return left || right;
}
