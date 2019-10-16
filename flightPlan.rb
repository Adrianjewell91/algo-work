# require 'byebug'

# def flightPlan(times, source, dest)
#     find_path(times, 
#               build_graph(times), 
#               source, 
#               get_flights(times, dest)) || -1 
# end

# def get_flights(times, dest)
# #     Could also find them from iterating a heapify at the same time. 
#     times.map.with_index { |flight, i| [flight, i] }.select{ |flight| flight[0][1] == dest }.sort{|a,b| a[0][3] <=> b[0][3]}
# end 

# def build_graph(times)
#     graph = []
#     times.each_with_index do |flight, idx|
#         graph.push([])
#         times.each_with_index do |child, idx2|
#             if idx2 == idx 
#                 next 
#             elsif (child[1] == flight[0]) && has_sufficient_time(child[3], flight[2])
#                 graph[idx].push(idx2)
#             end 
#         end 
#     end 
#     graph 
# end 

# def find_path(times, graph, source, flights)
#     # For each flight, try to find a path 
#     time = nil 
#     flights.each do |flight| 
#         time = dfs(times, graph, source, flight)
#         if !!time 
#             break 
#         end 
#     end 
    
#     time  
# end 

# # Graph: Adjacency List
# #Source : String 
# #Flights: Array
# def dfs(times, graph, source, flight)
#     #Are we going to push nodes or push indices, push indices.
#     #Push the index of the flight onto the stack, 
#     #While the stack has elements,
#     #Check if the flight on top's source equals the source. 
#     #If so, return the flight's arrival time: flight[0][3]
#     #Else, search for a node to push onto the stack,
#     #If I find one (not already traversed), push it onto the stack. 
#     #If I can't find one, pop off the stack.
#     #return nil,
#     stack = []
#     visited = {} 
#     stack.unshift(flight[1])
#     visited[flight[1]] = true 
    
#     while !stack.empty? 
#         # p source
#         # debugger if stack[0] == 8
#         # debugger if stack[0] == 6
#         if times[stack[0]][0] == source 
#             return flight[0][3]
#         else
#             child = graph[stack[0]].index{|node| !visited[node] } 
#             # p graph 
#             # p graph[stack[0]]
#             if child 
#                 visited[graph[stack[0]][child]] = true
#                 stack.unshift(graph[stack[0]][child])
#             else 
#                 stack.shift
#             end 
#         end 
#     end 
#     nil 
# end 

# def has_sufficient_time(arrival, dept)
#     # if (arrival < dept) 
#         i = 0
#         a = arrival.split(":").map { |el| el.to_i }
#         d = dept.split(":").map { |el| el.to_i }
#         # the arrival is later than the departure, 
#         if (a[0] >= d[0]) 
#             return false 
#         end

#         while true
#             if ((a[0] == d[0]) && (a[1] == d[1])) || i > 60 
#                 break 
#             end 
#             a[1] += 1 
#             if a[1] == 60 
#                 a[1] = 0
#                 a[0] += 1
#             end 
#             i += 1
#         end 
#         return i >= 60
#     # else 
#         # return false 
#     # end 
# end 

def to_min(time)
    h, m = time.split(/:/).map(&:to_i)
    h * 60 + m
end

def to_time(min)
    h, m = min / 60, min % 60
    '%02d:%02d' % [h, m]
end

def flightPlan(times, source, dest)
    d = {}
    d[source] = -60
    times.each { |a|
        a[2] = to_min(a[2])
        a[3] = to_min(a[3])
    }
    edges = Hash.new { |h, k| h[k] = [] }
    times.each { |from, to, dep, arr|
        edges[from] << [to, dep, arr]
    }
    h = {}
    p times
    until d.empty?
        p d
        k = d.each_key.min_by(&d)
        v = d.delete(k)
        h[k] = true
        return to_time(v) if k == dest
        edges[k].each { |to, dep, arr|
            next unless v + 60 <= dep
            next if h[to]
            d[to] = arr if d[to].nil? || arr < d[to]
        }
    end
    '-1'
end

times = [["Chicago", "Denver","03:00", "06:00"],
         ["Chicago", "Denver","03:30", "07:00"],
         ["Chicago", "Los Angeles", "01:00", "05:00"],
         ["Denver", "Austin", "06:30", "08:30"],
         ["Denver", "Austin", "07:30", "09:30"],
         ["Austin", "Denver", "06:30", "08:30"],
         ["Los Angeles", "Phoenix", "06:00", "07:00"],
         ["Los Angeles", "Phoenix", "05:30", "06:50"],
         ["Phoenix", "Austin", "08:00", "08:40"]]
# times = [["Seattle","Orlando","09:00","20:05"]]
# p flightPlan(times, 'Seattle', 'Columbus')  
p flightPlan(times, 'Chicago', 'Austin')
# times = [["aaaaaaaaaaaaaaa","acb","02:41","03:46"], 
#  ["aaaaaaaaaaaaaaa","aed","02:16","10:36"], 
#  ["aaaaaaaaaaaaaaa","aed","06:49","15:13"], 
#  ["aaaaaaaaaaaaaaa","aab","08:03","09:53"], 
#  ["aab","aeg","11:55","12:42"], 
#  ["aab","abi","10:46","16:31"], 
#  ["aab","ach","19:38","23:24"], 
#  ["aab","adc","16:06","22:28"], 
#  ["ach","aeh","26:05","35:28"], 
#  ["ach","adg","32:27","36:53"], 
#  ["ach","aac","32:38","35:18"], 
#  ["aac","ada","40:14","41:54"], 
#  ["aac","adc","42:56","45:11"], 
#  ["adc","aeb","23:28","33:27"], 
#  ["adc","acj","31:48","40:53"], 
#  ["adc","adi","27:00","36:04"], 
#  ["adc","adi","27:31","37:25"], 
#  ["adc","acb","27:55","35:18"], 
#  ["acb","ace","11:18","20:23"], 
#  ["acb","aah","07:37","12:41"], 
#  ["acb","abe","08:41","12:01"], 
#  ["acb","aaf","05:02","12:03"], 
#  ["acb","aae","12:49","22:38"], 
#  ["aae","adb","24:52","33:50"], 
#  ["aae","abb","30:20","38:30"], 
#  ["aae","aah","31:17","40:42"], 
#  ["abb","aaaaaaaaaaaaaaa","45:41","49:39"], 
#  ["abb","aee","44:15","51:10"], 
#  ["abb","add","46:55","54:42"], 
#  ["abb","aac","39:43","45:07"], 
#  ["aac","aci","44:07","53:00"], 
#  ["aac","aee","42:48","47:56"], 
#  ["aac","aea","44:07","53:03"], 
#  ["aac","aea","41:26","48:41"], 
#  ["aac","aag","38:26","42:16"], 
#  ["aag","aaaaaaaaaaaaaaa","51:55","59:12"], 
#  ["aag","aea","49:17","51:16"], 
#  ["aea","aec","54:31","54:36"], 
#  ["aea","aec","55:20","61:31"], 
#  ["aea","abd","49:42","56:49"], 
#  ["abd","aba","63:54","67:03"], 
#  ["abd","aca","65:32","70:50"], 
#  ["abd","ace","59:26","68:02"], 
#  ["aca","aeg","80:37","85:02"], 
#  ["aca","ade","80:01","86:28"], 
#  ["ade","abc","91:33","92:39"], 
#  ["ade","aee","92:48","101:36"], 
#  ["aee","abf","52:31","55:31"], 
#  ["aee","adg","51:09","55:17"], 
#  ["aee","x","48:46","58:35"], 
#  ["x","adj","66:17","68:59"], 
#  ["x","abj","61:27","68:41"], 
#  ["x","aad","63:54","70:49"], 
#  ["x","ada","61:23","70:21"], 
#  ["ada","abg","47:26","55:16"], 
#  ["ada","ach","46:51","55:00"], 
#  ["ach","aad","32:54","36:38"], 
#  ["ach","aeg","26:05","32:30"], 
#  ["ach","abg","32:32","39:14"], 
#  ["abg","acg","48:34","54:27"], 
#  ["abg","aeb","40:17","46:44"], 
#  ["abg","aah","44:47","45:10"], 
#  ["abg","adj","42:58","49:17"], 
#  ["abg","adh","46:51","56:05"], 
#  ["adh","aah","61:12","66:45"], 
#  ["adh","aef","65:56","66:19"], 
#  ["adh","x","63:05","65:42"], 
#  ["adh","abc","60:32","63:22"], 
#  ["abc","aaf","69:31","70:24"], 
#  ["aaf","aaaaaaaaaaaaaaa","21:39","26:58"], 
#  ["aaf","adc","14:30","22:36"], 
#  ["aaf","adh","13:11","20:37"], 
#  ["aaf","aba","14:48","18:06"], 
#  ["aaf","aag","17:58","21:03"], 
#  ["aag","abd","29:23","30:03"], 
#  ["aag","abg","22:24","29:11"], 
#  ["aag","aeh","21:39","24:33"], 
#  ["aeh","add","31:41","37:01"], 
#  ["aeh","acc","30:49","38:20"], 
#  ["aeh","aba","27:02","28:15"], 
#  ["aeh","aej","32:44","32:44"], 
#  ["aeh","acg","24:33","31:05"], 
#  ["acg","adh","34:27","36:50"], 
#  ["acg","abc","33:43","36:08"], 
#  ["adh","aej","22:27","22:55"], 
#  ["adh","abd","26:34","34:21"], 
#  ["adh","aed","21:59","31:04"], 
#  ["adh","add","30:34","35:49"], 
#  ["adh","adj","30:23","38:17"], 
#  ["adj","aeb","38:18","46:16"], 
#  ["adj","ace","39:56","47:00"], 
#  ["adj","abc","42:46","48:40"], 
#  ["adj","aci","40:21","41:02"], 
#  ["adj","aeb","39:29","44:01"], 
#  ["aeb","abh","43:04","44:22"], 
#  ["abh","abc","53:51","63:43"], 
#  ["abh","aed","52:01","54:14"], 
#  ["abh","ada","50:36","55:18"], 
#  ["abh","abb","46:57","47:28"], 
#  ["abb","aca","39:16","43:11"], 
#  ["abb","acg","39:10","44:08"], 
#  ["abb","aeg","44:03","47:23"], 
#  ["abb","acb","39:38","40:51"]]

#  p build_graph(times)
#  p flightPlan(times, "aaa", "jjj")