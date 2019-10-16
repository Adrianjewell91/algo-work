def five_sort(arr)
  #count the number of fives
  did_swap = false
  idx = 0
  num_of_fives = arr.count { |el| el == 5 }
  count = 0

  return arr if arr.length == 0 || num_of_fives == 0

  while true
    if arr[idx] == 5
      arr[idx], arr[idx+1] = arr[idx+1], arr[idx]
      did_swap = true
    else
      count += 1
    end

    break if did_swap == false && count == arr.length - num_of_fives

    if idx == arr.length - 2
      count = 0
      did_swap = false
    end

    idx = idx == arr.length - 2 ? 0 : idx + 1
  end

  arr
end

#[1,2,5,5,3,5,4,5,6]
length = 9
#idx = 4
count = 2
num of fives = 4
#Break if count == arr.length - num of fives and did-swap == false
