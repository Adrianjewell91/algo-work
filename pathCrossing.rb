require 'byebug'
def pathsCrossing(path)
    zeroIdx = 0
    path.each_with_index do |val,idx|
        next if [0,1,2].include?(idx)
        # p get(path,zeroIdx, idx-1) <= get(path,zeroIdx, idx-3)
        if get(path,zeroIdx, idx-1) <= get(path,zeroIdx, idx-3)
            # p minimum(path, idx, zeroIdx)
            # p val, idx
            # p minimum(path, zeroIdx, idx)
            if val < minimum(path, zeroIdx, idx)
                # p 
                zeroIdx = idx - 2 
            else 
                return true
            end
        end
    end
    false
end

# Monkey patch the array class. 
def get(path, zeroIdx, idx)
    idx < zeroIdx ? 0 : path[idx]
end

def minimum(path, zeroIdx, idx)
    # byebug
    if get(path,zeroIdx,idx-1) >= (get(path,zeroIdx,idx-3) - get(path,zeroIdx,idx-5))
        return get(path,zeroIdx,idx-2) - get(path,zeroIdx,idx-4)
    else 
        return get(path,zeroIdx,idx-2)
    end
end

p pathsCrossing([1,1,2,3,4,5,6,7,8]) == false
p pathsCrossing([1,1,2,5,3,7,5,9,7,12,5,2,2,1,1]) == false
p pathsCrossing([1,1,2,5,3,7,5,9,7,12,5,2,2,1,2]) == true
p pathsCrossing([1,1,2,5,3,7,5,9,7,12,5,3]) == true
p pathsCrossing([1,1,2,5,3,7,5,9,7,12,1,12]) == true
p pathsCrossing([1,1,2,5,3,7,5,9,7,12,1,11]) == false
p pathsCrossing([1,1,2,5,3,7,5,9,7,12,1,11,1]) == true
p pathsCrossing([1,1,2]) == false
p pathsCrossing([1,1,2,5,1,4]) == true
