require 'byebug'

# stack data structure, min and max O(1)

# push and pop 
# variables for min and max. 
# [1,2,3,4] 
# min [1]
# max [1,2,3,4] 

# 

# as I push numbers on to stack, keep track of min and max. 
# use another stack for max, and min. 

# class Stack 
#     def initialize 
#         @stack = [] 
#         @min_stack = []
#         @max_stack = []
#     end 

#     def min
#         @min_stack[-1]
#     end 

#     def max
#         @max_stack[-1]
#     end 

#     def push(val)
#         @stack.push(val)
#         #edge case, when you push on the first number. 
#         #need to push into both min and max stacks. 
#         #check if stack length == 1 
#         if @stack.length == 1
#             @max_stack.push(val)
#             @min_stack.push(val)
#         elsif val > @max_stack[-1]
#             @max_stack.push(val)
#         elsif val < @min_stack[-1]
#             @min_stack.push(val)
#         end 
#         #do some logic, assess whether to modify min and max. 
#         #check if the new top of the stack is greater than max or less than min 
#         #based on asnwer, modify min and max accordingly, 
#         # 
#         #do we add to the min and max stacks. 
#     end 

#     def pop
#         val = @stack.pop
#         if @stack.length == 0
#             @max_stack.pop
#             @min_stack.pop
#         elsif val == @max_stack[-1]
#             @max_stack.pop
#         elsif val == @min_stack[-1]
#             @min_stack.pop
#         end 
#     end 

#     def peek
#         @stack[-1]
#     end 
# end 

# stack = Stack.new()
# # Push
# stack.push(3)
# p stack.max == 3
# p stack.min == 3

# stack.push(4)
# p stack.max == 4
# p stack.min == 3

# stack.push(0)
# p stack.max == 4
# p stack.min == 0

# stack.push(5)
# p stack.max == 5
# p stack.min == 0

# # Pop
# stack.pop
# p stack.max == 4
# p stack.min == 0

# stack.pop
# p stack.max == 4
# p stack.min == 3

# stack.pop
# p stack.max == 3
# p stack.min == 3

# stack.pop
# p stack.max == nil 
# p stack.min == nil


# Linked list.
# Reverse the linked list - singley linked.

# 3 -> 4 -> 5 -> 6
# Three pointers 

# new_list = temp2
# new_list.next = nil 
# new_list.next = temp1
# new_list.next = nil 

# while !!temp2
#moving temp2 down the list, and assigning new_list and temp1

# return new_list

class Node
    attr_accessor :next, :value
end 

head = Node.new
linked_list = head

linked_list.value = 3
linked_list.next = Node.new 
linked_list = linked_list.next

linked_list.value = 4
linked_list.next = Node.new 
linked_list = linked_list.next

linked_list.value = 5
linked_list.next = Node.new 
linked_list = linked_list.next

linked_list.value = 6
linked_list.next = nil

def reverse_linked_list(head)
    #Reverse the linked list. 
    # leng at least one 
    # return nil if !head
    new_list = nil 
    temp1 = head
    temp2 = head.next 
    temp1.next = nil

    while temp2 != nil
        # debugger
        new_list = temp2    
        temp2 = temp2.next #The order of these two lines is important.
        new_list.next = temp1 #and this one, must go after the previous.
        temp1 = new_list
    end 
    # debugger
    return new_list
end 

# Tests - TDD
# p head.value == 3
reversed = reverse_linked_list(head)
[6,5,4,3].each do |num|
    p reversed.value == num
    reversed = reversed.next
end 