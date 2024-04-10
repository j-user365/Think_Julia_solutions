fruits = "🍌 🍎 🍐"
nextind(fruits, 1)

# every emoji is 4 bytes!, indexing is byte-based
sizeof(fruits)
length(fruits)


#########################
# Exercise 8.1          #
#########################
function backwards(text)

    index = lastindex(text)

    while index >= 1
        letter = text[index]
        println(letter)
        index = prevind(text, index)
    end
end

backwards("apple")


#########################
# Exercise 8.2          #
#########################
prefixes = "JKLMNOPQ"
suffix = "ack"

for letter in prefixes
    if (letter == 'O') || (letter == 'Q')
        println(letter * 'u' * suffix)
    else
        println(letter * suffix)
    end
end


#########################
# Exercise 8.3          #
#########################
str = "Julias Caesar"

str[:]

#-------------------------------------------------------------
# Strings are immutable
str[1] = 'K'

str = 'K' * str[2:end]
str

#-------------------------------------------------------------
greet = "Hello"
whom = "World"
"$greet, $(whom)"

"1 + 2 = $(1 + 2)"


#########################
# Exercise 8.4          #
#########################
function find(word, letter, start_index)

    index = max(firstindex(word), start_index)

    indices = []

    while index <= sizeof(word)
        if word[index] == letter
            push!(indices, index)
        end
        index = nextind(word, index)
    end

    if indices != []
        return indices
    else
        return -1
    end
end

indices = find("apple", 'p', -2)


#########################
# Exercise 8.5          #
#########################
function count(text, letter)

    counter = 0

    for char in text
        if char == letter
            counter = counter + 1
        end
    end

    return counter
end

count("apple", 'l')

#-------------------------------------------------------------
function count_expand(text, letter, start_index)

    index = max(firstindex(text), start_index)

    counter = 0

    while index <= sizeof(text)
        if text[index] == letter
            counter = counter + 1
        end
        index = nextind(text, index)
    end

    return counter
end

count_expand("apple", 'a', -1)


#########################
# Exercise 8.6          #
#########################
function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end

    i = firstindex(word1)
    j = lastindex(word2)

    while (j >= 0) && (i <= length(word1))
        if word1[i] != word2[j]
            return false
        end

        i = nextind(word1, i)
        j = prevind(word2, j)
    end

    return true
end

isreverse("pots", "stop")


#########################
# Exercise 8.7          #
#########################
# https://docs.julialang.org/en/v1/manual/strings/

Int('x')
Int('\t')
Char(120)
'\u78'          # unicode
"\u2200 x \u2203 y"

"Hello"[begin]

"Hello"[1]      # character
"Hello"[1:1]    # string with single character

collect(eachindex("Hello"))

"1 + 2 = 3" == "1 + 2 = $(1 + 2)"


#########################
# Exercise 8.8          #
#########################
# ?count

count('a', "banana")


#########################
# Exercise 8.9          #
#########################
function ispalindrome(word)

    if word[begin:1:end] == word[end:-1:begin]
        return true
    end

    return false
end

ispalindrome("lepels")


#########################
# Exercise 8.10         #
#########################
function anylowercase1(text)
    for c in text
        if islowercase(c)
            return true
        else
            return false
        end
    end
end

anylowercase1("Apple")

#-------------------------------------------------------------
function anylowercase2(text)
    for c in text
        if islowercase('c')
            return "true"
        else
            return "false"
        end
    end
end

anylowercase2("APPLE")

#-------------------------------------------------------------
function anylowercase3(text)
    for c in text
        flag =  islowercase(c)
    end
    return flag
end

anylowercase3("apple")

#-------------------------------------------------------------
function anylowercase4(text)
    flag = false
    for c in text
        flag =  flag || islowercase(c)
    end
    return flag
end

anylowercase4("Apple")

#-------------------------------------------------------------
function anylowercase5(text)
    for c in text
        if !islowercase(c)
            return false
        end
    end
    return true
end

anylowercase5("Apple")


#########################
# Exercise 8.11         #
#########################
function rotateword(word, num)

    if num > (Int('z') - Int('a') + 1)
        num = num - (Int('z') - Int('a') + 1)
    end


    new_word = ""


    for letter in word
        let_origi = Int(letter)

        new_val = let_origi + num


        if  (let_origi >= Int('a')) && (let_origi <= Int('z')) && (new_val > Int('z'))
            use_val = new_val - Int('a')

        elseif (let_origi >= Int('a')) && (let_origi <= Int('z')) && (new_val < Int('a'))
            use_val = Int('z') - (Int('a') - new_val) + 1

        elseif (let_origi >= Int('A')) && (let_origi <= Int('Z')) && (new_val > Int('Z'))
            use_val = new_val - Int('A')

        elseif (let_origi >= Int('A')) && (let_origi <= Int('Z')) && (new_val < Int('A'))
            use_val = Int('Z') - (Int('A') - new_val) + 1

        else
            use_val = new_val

        end


        let_new = Char(use_val)

        new_word = new_word * let_new
    end

    return new_word
end


rotateword("JoLlY", -33)

