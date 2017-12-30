require 'byebug'

def textJustification(words, l)
    #how to fill the words
    justified_words = []
    until words.length <= 1
        row = []
        #plug in words, plus a space, until adding another word will send it over the limit.
        #then remove that last space and call fill_spaces
        #shovel into justified_words and reset row.
        until words.length==0 || ((row.join('').length + words[0].length) > l)
          row << words.shift + " "
          # row << ' '
        end

        row[-1] = row[-1][0...-1]
        justified_words << fill_spaces(row, l)
        row = []
    end

    if words.length == 1
        last_row = words.shift
        until (last_row.length == l)
           last_row += ' '
        end
        justified_words << last_row
    end


    #I need to modify the last string such that any extra spaces are put at end.
    # "evenly  as  possible" => 'evenly as possible  '
    # byebug
    if justified_words[-1].split(' ').length > 1
        row = justified_words[-1].split('')
        extra_spaces = ""
        row[0...-1].each_index do |idx|
           if row[idx] == ' ' && row[idx+1] == ' '
             extra_spaces += " "
           end
        end

        justified_words[-1] = justified_words[-1].split(' ').join(' ') + extra_spaces
    end

    justified_words
end

def fill_spaces(words,l)
    counter = 0
    # byebug
    until words.join('').length == l
        words[counter] += ' '
        # next if words[counter] == ' '
        counter = counter >= (words.length - 2) ? 0 : counter + 1
    end

    words.join('')
end

if $PROGRAM_NAME == __FILE__
  p textJustification(%w(extra spaces between words should be distributed as evenly as possible), 20)
  p textJustification(%w(looks like it can be a tricky test), 25)
  p textJustification(%w(two words.), 11)
  # ["this     is   an", "example         "]
end
