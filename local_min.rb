require('byebug')

# Find a local min in an array given some constraints. 

def local_min(arr)
    mid = arr.length/2
    min = arr[mid]
    upper = arr.length-1
    lower = 0

    while !(arr[mid+lower+1] > min && arr[mid+lower-1] > min)
        # byebug
        #Calculate a new mid point and upper and lower bound.
        if arr[mid+1] < min 
            lower = mid
        else
            upper = mid
        end
        mid = ((upper - lower) / 2) 
        min = arr[mid + lower] 
    end
    min
end

p local_min([11,2,3]) == 2
p local_min([11,2,3,5,12,7,4,15,16]) == 4 
