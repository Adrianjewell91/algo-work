def currencyArbitrage(exchanges)
    exchanges.each_index do |currency|
        if arbitrage_is_possible(currency, exchanges)
            return true 
        end 
    end 
    false 
end 

def relax(currency, exchanges, distance, &bloc)
    exchanges.each_index do |exchangable_currency|
        exchanges[exchangable_currency].each_with_index do |conversion_rate, idx|
            next if conversion_rate == 1 
            if distance[exchangable_currency] * conversion_rate > distance[idx]
                yield(exchangable_currency, idx, conversion_rate)
            end 
        end 
    end              
end 

def arbitrage_is_possible(currency, exchanges)
    distance = Array.new(exchanges.length).map.with_index{ |_,idx| exchanges[currency][idx] }                 
    
    relax(currency, exchanges, distance) { |exchangable_currency, idx, conversion_rate| 
          distance[idx] = distance[exchangable_currency] * conversion_rate }

    relax(currency, exchanges, distance) { |exchangable_currency, idx, conversion_rate| 
        return true if distance[exchangable_currency] * conversion_rate > 1 && currency == idx }

    false
end 


#[[1,0.5,0.2],[1.8,1,0.5],[4.05,1.2,1]] : Yes
# For each index in the array (which represents the vertex), check for arbitrage

# p currencyArbitrage([[1,0.5,0.2],[1.8,1,0.5],[4.05,1.2,1]])
# p currencyArbitrage([[1,0.5,0.2], [1.8,1,0.5], [3.95,1.2,1]])
p currencyArbitrage([[1,1.8,1,0.5,0.5], 
 [0.4,1,0.4,0.1,0.2], 
 [0.3,1.5,1,0.4,0.3], 
 [0.8,0.8,2,1,1.6], 
 [0.2,0.7,0.2,0.4,1]])


