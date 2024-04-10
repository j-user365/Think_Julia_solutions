#########################
# Exercise 10.1         #
#########################
function nestedsum(t)
    sum1 = sum.(t)
    sum2 = sum(sum1)

    return sum2
end

t = [[1, 2], [3], [4, 5, 6]]

nestedsum(t)


#########################
# Exercise 10.2         #
#########################
function cumulsum(t)
    new_array = []

    for i in eachindex(t)
        new_array = push!(new_array, sum(t[1:i]))
    end

    return new_array
end

t = [1, 2, 3]

print(cumulsum(t))


#########################
# Exercise 10.3         #
#########################
function interior(t)
    new_array = t[2:end-1]

    return new_array
end

t = [1, 2, 3, 4]

print(interior(t))
print(t)


#########################
# Exercise 10.4         #
#########################
function interior!(t)
    pop!(t)
    popfirst!(t)

    return
end

interior!(t)
print(t)


#########################
# Exercise 10.5         #
#########################
function issort(t)

    if t == sort(t)
        return true
    else
        return false
    end
end

issort([1, 2, 3])

issort(['b', 'a'])


#########################
# Exercise 10.6         #
#########################
function isanagram(text1, text2)
    if sizeof(text1) != sizeof(text2)
        return false
    end

    new_text1 = text1[:]         # create new variable that doesn't overwrite text1
    new_text1 = sort(collect(new_text1))
    new_text2 = text2[:]         # create new variable that doesn't overwrite text2
    new_text2 = sort(collect(new_text2))


    for i in eachindex(new_text1)
        if new_text1[i] == new_text2[i]
            isanagram(new_text1[2:end], new_text2[2:end])
        else
            return false
        end
    end

    return true
end

isanagram("text", "txet")


#########################
# Exercise 10.7         #
#########################
function hasduplicates(t)

    # To let the function work if different datatypes are combined, check datatype per item
    types = map(x -> typeof(x), t)

    # Check for items per datatype
    for i in unique(types)

        # Create empty array and put every item of that datatype in new array
        new_array = []

        for ii in eachindex(types)
            if i == types[ii]
                new_array = push!(new_array, t[ii])
            end
        end

        # Sort the data
        new_array = sort(new_array)

        # Check if 2 consecutive itmes are the same of not
        for i in eachindex(new_array)[2:end]
            if typeof(new_array[i-1]) == typeof(new_array[i])
                if new_array[i-1] == new_array[i]
                    return true
                end
            end
        end

        return false
    end

end

t = [1, 2, 3, 2]

hasduplicates(t)
println(t)

t = ['a', 'b']
hasduplicates(t)
println(t)

t = [1, 2, 3, 'a', 'b', 2]

hasduplicates(t)
println(t)


#########################
# Exercise 10.8         #
#########################
using Pkg

Pkg.add("Statistics")

using Statistics

function rand_birth(n)
    empty_array = []

    for i in 1:n
        birthday = rand(1:365)
        push!(empty_array, birthday)
    end

    if length(empty_array) == length(unique(empty_array))
        return 1
    else
        return 0
    end
end

num_iteration = 10000
occurences = []
for i in 1:num_iteration
    occ = rand_birth(23)
    push!(occurences, occ)
end

mean(occurences)*100


#########################
# Exercise 10.9         #
#########################
function read_text1()
    empty_array = []

    for line in eachline("./Files/words.txt")
        push!(empty_array, line)
    end

    return empty_array
end

function read_text2()
    empty_array = []

    for line in eachline("./Files/words.txt")
        empty_array = [empty_array..., line]
    end

    return empty_array
end

text_array = read_text1();
read_text2()


#########################
# Exercise 10.10        #
#########################
function inbisect(sorted_array, target)

    halfway_point = Int(round(length(sorted_array)/2))
    
    #println(halfway_point)

    if length(sorted_array) == 2
        if sorted_array[1] == target
            return true
        elseif sorted_array[2] == target
            return true
        else
            return false
        end
    end


    if sorted_array[halfway_point] == target
        return true
    elseif sorted_array[halfway_point] < target
        inbisect(sorted_array[halfway_point:end], target)
    elseif sorted_array[halfway_point] > target
        inbisect(sorted_array[1:halfway_point], target)
    end
end

length(text_array)

inbisect(text_array, text_array[113201])
inbisect(text_array, "bananaq")


#########################
# Exercise 10.11        #
#########################
function reversepairs(input_array)

    # create new copy of array to avoid overwriting original array
    new_array = input_array[:]

    for word in new_array
        rev_word = reverse(word)

        # avoid palindromes!
        if word != rev_word && inbisect(new_array, rev_word)

            # delete rev_word to avoid duplicate findings
            idx = findfirst(x -> x == rev_word, new_array)
            deleteat!(new_array, idx)

            println(word * " and " * rev_word)
        end
    end
end

reversepairs(text_array)


#########################
# Exercise 10.12        #
#########################

# werkt maar duurt veel te lang

function interlock(input_array)

    new_array = input_array[:]

    for word1 in new_array
        for word2 in new_array
            
            new_word = ""

            # Only check word that have a different in length of max 1 letter
            if word1 != word2
                if length(word1) == length(word2) || length(word1) == (length(word2) + 1)
                    new_word1 = word1
                    new_word2 = word2
                elseif length(word1) == (length(word2) - 1)
                    new_word1 = word2
                    new_word2 = word1
                else
                    new_word1 = ""
                end
           
                # If length differs more than 1 letter skip
                if new_word1 !== ""
                    for i in 1:length(new_word1)
                        if i <= length(new_word2)
                            new_word = new_word * new_word1[i] * new_word2[i]
                        else
                            new_word = new_word * new_word1[i]
                        end
                    end
                end
            end

            # Check if a new word is created by interlocking
            if new_word !== ""
                if inbisect(input_array, new_word)
                    println(word1 * " and " * word2 * " make " *new_word)
                end
            end

            #println(word1 * " and " * word2)

        end

        # Delete word1 after use to avoid duplicate findings when word2 becomes word1
        idx = findfirst(x -> x == word1, new_array)
        if idx !== nothing
            deleteat!(new_array, idx)
        end
    end
end

interlock(text_array)

#-------------------------------------------------------------
# Alternative code
# Help from https://github.com/epequeno/ThinkPy-Solutions/blob/master/ch10/10.10.py
function interlock(input_array)

    new_array = input_array[:]

    for word in new_array

        word1 = word[1:2:end]
        word2 = word[2:2:end]

        if inbisect(new_array, word1) && inbisect(new_array, word2)
            println(word1 * " and " * word2 * " make " *word)
        end

    end
end

interlock(text_array)

#-------------------------------------------------------------
function interlock_three(input_array)

    new_array = input_array[:]

    for word in new_array

        word1 = word[1:3:end]
        word2 = word[2:3:end]
        word3 = word[3:3:end]

        if inbisect(new_array, word1) && inbisect(new_array, word2) && inbisect(new_array, word3)
            println(word1 * ", " * word2 * " and " * word3 * " make " * word)
        end

    end
end

interlock_three(text_array)