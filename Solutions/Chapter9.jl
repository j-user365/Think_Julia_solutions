fin = open("./Files/words.txt")

readline(fin)
readline(fin)

close(fin)


for line in eachline("./Files/words.txt")
    println(line)
end


#########################
# Exercise 9.1          #
#########################
for line in eachline("./Files/words.txt")
    # Remove whitespace
    line = replace(line, " " => "")
    if length(line) > 20
        println(line)
    end
end


#########################
# Exercise 9.2          #
#########################
function hasno_e(word)
    if !occursin("e", word)
        return true
    else
        return false
    end
end

hasno_e("apple")

#-------------------------------------------------------------
counter = 0
total = countlines("./Files/words.txt")

for line in eachline("./Files/words.txt")
    # Remove whitespace
    line = replace(line, " " => "")
    if hasno_e(line)
        println(line)
        counter = counter + 1
    end
end

counter/total*100


#########################
# Exercise 9.3          #
#########################
function avoids(word, letters)
    individual_letters = split(letters, "")

    for i in individual_letters
        if occursin(i, word)
            return false
        end
    end

    return true
end

avoids("apple", "zhpy")

#-------------------------------------------------------------
function avoids2()

    println("Give your forbidden letters:"); letters = readline()

    individual_letters = split(letters, "")

    counter = 0

    for line in eachline("./Files/words.txt")
        check = true

        # Remove whitespace
        word = replace(line, " " => "")

        for i in individual_letters
            if occursin(i, word)
                check = false
            end
        end

        if check
            counter = counter + 1
        end
    end

    print(counter)

end

avoids2()

#-------------------------------------------------------------
function avoids3(letters)

    individual_letters = split(letters, "")

    counter = 0

    for line in eachline("./Files/words.txt")
        check = true

        # Remove whitespace
        word = replace(line, " " => "")

        for i in individual_letters
            if occursin(i, word)
                check = false
            end
        end

        if check
            counter = counter + 1
        end
    end

    return counter

end


using DataFrames
using Random
alphabet = collect('a':'z');
monte_carlo = 10000;
df = DataFrame(Letters = String[], Word_count = Int32[]);

for i in 1:monte_carlo
    random_indices = randperm(length(alphabet))[1:5]
    random_letters = alphabet[random_indices]
    random_string = join(random_letters, "")
    
    amount = avoids3(random_string)

    push!(df, [random_string, amount])
end

# Find the index of the row with the lowest Word_count
min_index = argmin(df.Word_count)

# Print the row with the lowest Word_count
println(df[min_index, :])


#########################
# Exercise 9.4          #
#########################
function useonly(word, letters)

    # Check if provided letters occur in word
    individual_letters = split(letters, "")
    
    for i in individual_letters
        if !occursin(i, word)
            return false
        end
    end


    # Check if no non-provided letters occur in word
    alphabet = collect('a':'z')
    alphabet_without = filter!(x -> !(x in letters), alphabet)
    
    for i in alphabet_without
        if occursin(i, word)
            return false
        end
    end

    
    return true
end

useonly("apple", "aple")

#-------------------------------------------------------------
function useonly2(word, letters)
    for i in word
        if i ∉ letters
            return false
        end
    end

    return true
end

useonly2("apple", "aple")


#########################
# Exercise 9.5          #
#########################
function usesall(word, letters)

    # check if al provided letters occur in word
    for i in letters
        if !occursin(i, word)
            return false
        end
    end

    return true
end

usesall("apple", "apl")

#-------------------------------------------------------------
function usesall2(word, letters)

    for i in letters
        if i ∉ word
            return false
        end
    end

    return true
end

usesall2("apple", "apl")

#-------------------------------------------------------------
counter = 0
letters = "aeiouy"

for line in eachline("./Files/words.txt")
    if usesall(line, letters)
        counter = counter + 1
    end
end

counter


#########################
# Exercise 9.6          #
#########################
function isabecedarian(word)

    length_word = length(word)

    if length_word <= 1
        return true
    end

    word = lowercase(word)

    individual_letters = split(word, "")

    for i in 2:length_word
        if individual_letters[i] < individual_letters[i-1]
            return false
        end
    end

    return true
end

isabecedarian("abCd")

#-------------------------------------------------------------
function isabecedarian2(word)

        i = firstindex(word)
        previous_letter = word[i]

        j = nextind(word, i)

        for letter in word[j:end]
            if letter < previous_letter
                return false
            end

            previous_letter = letter
        end

        return true
end

isabecedarian2("abcd")

#-------------------------------------------------------------
function isabecedarian3(word)

    if length(word) <= 1
        return true
    end

    i = firstindex(word)
    j = nextind(word, i)

    if word[i] > word[j]
        return false
    end

    isabecedarian3(word[j:end])
end

isabecedarian3("abcd")


#########################
# Exercise 9.7          #
#########################
for line in eachline("./Files/words.txt")

    length_word = length(line)

    counter = 0

    if length_word >= 6

        for i in 2:(length_word-4)
            if (line[i] == line[i-1]) && (line[i] != line[i+1]) && (line[i+1] == line[i+2]) && (line[i+2] != line[i+3]) && (line[i+3] == line[i+4])
                println(line)
            end
        end

    end
end


#########################
# Exercise 9.8          #
#########################
function ispalindrome(text)

    if sizeof(text) <= 1
        return true
    end

    for letter in text
        i = firstindex(text)
        j = lastindex(text)

        if text[i] == text[j]
            if ispalindrome(text[nextind(text, i): prevind(text, j)])
                return true
            else
                return false
            end
        else
            return false
        end
    end
end

ispalindrome("0000")


for i in 0:999999

    num_string1 = lpad(i, 6, '0')
    num_string2 = lpad(i+1, 6, '0')
    num_string3 = lpad(i+2, 6, '0')
    num_string4 = lpad(i+3, 6, '0')
    
    if ispalindrome(num_string1[end-3:end]) && ispalindrome(num_string2[end-4:end]) && ispalindrome(num_string3[2:end-1]) && ispalindrome(num_string4)
        println(num_string1)
    end

end


#########################
# Exercise 9.9          #
#########################
for age_child in 6:85

    # Calculate current age mother and age difference between child and mother
    age_child_string = lpad(age_child, 2, '0')
    age_mother_string = reverse(lpad(age_child, 2, '0'))

    age_difference = parse(Int, age_mother_string) - parse(Int, age_child_string)

    check_before = false
    check_after = false

    # Mother has to be older than child
    if age_difference > 0

        counter_before = 0
        counter_after = 0

        # Check if ages were reversed 6 times before (including this year)
        for i in 1:age_child
            age_child_before_string = lpad(i, 2, '0')

            age_mother_before = i + age_difference
            age_mother_before_string = lpad(age_mother_before, 2, '0')

            if age_child_before_string == reverse(age_mother_before_string)
                counter_before = counter_before + 1
            end
        end

        if counter_before == 6
            check_before = true
        end
        
        # Check if ages will be reversed 2 times after this year
        for i in (age_child+1):99
            age_child_after_string = lpad(i, 2, '0')

            age_mother_after = i + age_difference
            age_mother_after_string = lpad(age_mother_after, 2, '0')

            if age_child_after_string == reverse(age_mother_after_string)
                counter_after = counter_after + 1
            end
        end

        if counter_after == 2
            check_after = true
        end
    end

    # If both checks are true, print age of child
    if check_before && check_after
        println(age_child)
    end
end


