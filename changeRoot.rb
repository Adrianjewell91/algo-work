require 'byebug'

def changeRoot(parent, newRoot)
    duped_parent = parent.dup
    new_root = newRoot

    saved = duped_parent[new_root]
    duped_parent[new_root] = new_root
    next_idx = duped_parent[saved]
    duped_parent[saved] = new_root

    until saved == next_idx
        new_root = saved
        saved = next_idx
        next_idx = duped_parent[saved]
        duped_parent[saved] = new_root
    end

    duped_parent
end

# [10, 3, 0, 5, 10, 0, 5, 0, 8, 10, 8, 13, 3, 3, 2]
#
# saved 5
# next_idx 5
# new_root 0

if $PROGRAM_NAME == __FILE__
   p changeRoot([0,0,0,1], 1)
   p changeRoot([5, 3, 0, 5, 10, 5, 5, 0, 10, 10, 0, 13, 3, 3, 2], 8)
end
