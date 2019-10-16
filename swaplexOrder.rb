require 'byebug'

def swapLexOrder(str, pairs)
    new_str = str
    hash = {}
    #get the hash of linkages.
    i = 0
    j = 0
    while i < pairs.length
       if hash[pairs[i][j]]
           if j == 1
              hash[pairs[i][j]] << pairs[i][0]
              else
              hash[pairs[i][j]] << pairs[i][1]
           end
       else
           if j == 1
              hash[pairs[i][j]] = [pairs[i][0]]
              else
              hash[pairs[i][j]] = [pairs[i][1]]
           end
       end

       if j == 1

          i += 1
          j  = 0
       else
          j += 1
       end
    end

    #build the groups from hash.
    i = 0
    j = 0
    current = nil
    queue = []
    result = []
    while i < pairs.length
       if hash[pairs[i][j]]
          set = {}
          set[pairs[i][j]] = true
          queue += hash[pairs[i][j]]
          while queue.length > 0
             current = queue.shift
             if hash[current] != nil
                   p hash[current]
                   queue += hash[current]
                   set[current] = true
                   hash[current] = nil
             end
          end
          result << set.keys.sort
       end

          if j == 1
             i += 1
             j  = 0
          else
             j += 1
          end
    end

    #sort the characts in each group and then
    k = 0
    while k < result.length
      byebug
       chars = result[k].map{|idx| str[idx-1]}.sort{|el1, el2| el2 <=> el1}
       idx = 0
       while idx < result[k].length
          new_str[result[k][idx]-1] = chars[idx]
          idx += 1
       end
       k+= 1
    end
    #put than into array at those indices.

    p result
    new_str
end



if $PROGRAM_NAME == __FILE__
  p swapLexOrder("abcd",[[1,4],[3,4]])
end
