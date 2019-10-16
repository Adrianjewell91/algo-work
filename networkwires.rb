require ('byebug')

def networkWires(n, wires)
    graph = Array.new(n) { Array.new(n, 0) }
    sum = 0
    total = 0
    visited = Hash.new(false)
    
    wires.each do |wire|
        graph[wire[0]][wire[1]] = wire[2]
        graph[wire[1]][wire[0]] = wire[2]
        total += wire[2]
    end 
    p graph
    (0..n-1).to_a.each do |node1|
        if !visited[node1]
            visited[node1] = true 
            stack = [node1]
            while stack.length > 0
                # p graph[stack[-1]][stack[-1]..-1]   
                graph[stack[-1]].each_with_index do |connection, node2|
                    if connection > 0 && !visited[node2]
                        stack << node2
                        visited[node2] = true
                        break
                    elsif connection > 0 && visited[node2] && (stack.include?(node2)) && (stack[-2] && stack[-2] != node2)
                        # byebug
                        repeated = node2 
                        max = connection 
                        popped = stack.pop
                        delete = [node2, popped]
                        visited[popped] = false                        
                        while popped != repeated 
                            p stack, popped
                            if graph[stack[-1]][popped] > max 
                                max = graph[stack[-1]][popped]
                                delete = [stack[-1], popped]
                            end 
                            popped = stack.pop
                            visited[popped] = false
                        end 
                        sum += max
                        graph[delete[0]][delete[1]] = 0
                        graph[delete[1]][delete[0]] = 0
                        break
                    elsif node2 == graph[stack[-1]].length - 1 
                        stack.pop
                        break
                    end 
                end 
            end 
        end 
    end 
    total - sum
end

p networkWires(7,
[[0,1,1], 
 [2,0,2], 
 [1,2,3], 
 [3,4,1], 
 [4,5,2], 
 [5,6,3], 
 [6,3,2]])

