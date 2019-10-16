require 'byebug'

def maximalSquare(matrix)
    max = 0 
    squares = Hash.new(nil)
    i = 0 
    while i < matrix.length
        j = 0 
        length = 0 
        while j < matrix[i].length 
            if matrix[i][j] == '1' 
                length += 1 
                if max == 0 
                    max = 1 
                else     
                    # byebug
                    if squares[[i,j]]
                        squares[[i,j]].each do |square|                         
                            square[:indices] += 1
                            #   byebug
                            if isComplete(square) && square[:length]**2 > max  
                                max = square[:length]**2 
                            else 
                                if squares[nextIndex(square)]
                                    squares[nextIndex(square)].push(square)
                                else 
                                    squares[nextIndex(square)] = [square]
                                end 
                            end 
                        end 
                        squares[[i,j]] = Array.new()
                    end 
                    
                      if length > Math.sqrt(max) 
                          new_length = length
                          while new_length > Math.sqrt(max)
                            new_square = Hash.new(nil)
                            new_square[:length] = new_length
                            new_square[:first] = [i,j-new_length+1]
                            new_square[:indices] = 0
                            column = j - new_length + 1 
                            while column <= j 
                                new_square[:indices] += 1
                                column += 1 
                            end 
                            if squares[nextIndex(new_square)]
                                squares[nextIndex(new_square)].push(new_square)
                            else 
                                squares[nextIndex(new_square)] = [new_square]
                            end 
                            new_length -= 1
                          end 
                      end 
                end 
            else 
                length = 0 
            end 
            j += 1
        end 
        i += 1
    end 
    
    return max 
end
    
def isComplete(square)
    square[:indices] == square[:length]**2
end 
    
def nextIndex(square)
    return [square[:first][0] + (square[:indices]/square[:length]), 
            (square[:first][1] + (square[:indices] % square[:length]))]
end 

# There is an O(n) solution:
# For each index that is a 1, log its relationships to the others around it, and if a 1 completes a square then log the new square's area if it's larger than the current one. 
# I know i've found a square when and index is the corner stone of a square, and all of the square has been filled it. 
# I've found a square when the last number is filled in a model of a square that I have started. 
# For all other numbers, I know I'm adding to potential squares when the index is directly adjacent to other numbers. 
# For each index with a 1, it either starts a new square or fits into an existing potential square. 
# OFr each index of a 1 to the right of a 1, a new potential square starts of that length. 
# So for each row, each index of 1 can start a new square, fill a role in a previous square or do both at the same time. Starting a new square can be done in two ways: a brand new length or expanding a previously start square with a previous intended length. 
# So for each index that is a 1, the options are:
#     If the max is zero, then set the max = 1, because a single index of 1 is a square with area 1.
#     else:
#     Iterate through all previously started squares (length >= 2) and see if it fits into any of them. 
#     Start a new square.  
#    
# Naive solution is to try to build a square at each index, and store the largest one found yet.
#   For each idnex that is 1 do a search and down and try to build a square. 
#   How to represent a square, a collection of indices, a hash of areas, and area is an array of possible squares with the indices as the options, if any of these are all true then a square is completed, and all of the hashes with that area can be deleted. 
# [{[0,0]: true [0,1]: true, [1,0]: false, [1,1]:false}, {...}, {...}]
#   
#   ARe there any other ways? Is this really more efficient? YEs, because it's a single iteration through the matrix, and then an iteration through previous started squares, but the number of iterations will descrease as larger squares are found, for example there will be no point in starting a new 4 area square when the max is already 4, only 9 area squares will be started or kept. 
#   How to assign a value to a potential square: at that area, for each hash, check is the current index is in the area, if it is, assign it, and then check if all of the values are checked, if so, then the square is complete, and this is the new max. 

# [10, 3, 0, 5, 10, 0, 5, 0, 8, 10, 8, 13, 3, 3, 2]
#
# saved 5
# next_idx 5
# new_root 0

if $PROGRAM_NAME == __FILE__
    p maximalSquare(
[["1","0","1","0","0"], 
 ["1","0","1","1","1"], 
 ["1","1","1","1","1"], 
 ["1","0","0","1","0"]])
end
