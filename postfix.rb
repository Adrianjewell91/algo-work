require "byebug"
OPERATIONS = [:+, :-, :*, :/]

def build_tree(str)
    root = { val: str[-1].to_sym, parent: nil }
    node = root
    str[0..-2].chars.reverse.each do |val|
        if OPERATIONS.include?(val.to_sym) && !node[:left]
            node[:left] = { val: val.to_sym, parent: node }
            node = node[:left]
        elsif OPERATIONS.include?(val.to_sym) && node[:left]
            node[:right] = { val: val.to_sym, parent: node }
            node = node[:right]
        elsif !node[:left]
            node[:left] = { val: val.to_i, parent: node }
        elsif node[:left]
            node[:right] = { val: val.to_i, parent: node }
            while node[:left] && node[:right]
                break if node[:parent] == nil
                node = node[:parent]
            end
        end
    end
    # debugger
    root
end

def evaluated(root)
    if OPERATIONS.include?(root[:val])
        return [evaluated(root[:right]), evaluated(root[:left])].reduce(root[:val])
    else 
        return root[:val]
    end
end

p evaluated(build_tree("354-35+3+*+")) 
p evaluated(build_tree("35+")) 
p evaluated(build_tree("82/5+")) 