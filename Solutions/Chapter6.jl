#########################
# Exercise 6.1          #
#########################
function compare(x, y)

    if x > y
        return 1
    elseif x == y
        return 0
    elseif x < y
        return -1
    end

end

compare(4, 9)


#########################
# Exercise 6.2          #
#########################
function hypothenuse(a, b)
    a_sq = a^2
    b_sq = b^2
    c = sqrt(a_sq + b_sq)
    
    return c
end

hypothenuse(3, 4)


#########################
# Exercise 6.3          #
#########################
function isbetween(x, y, z)
    if x <=y & y <=z
        return true
    else
        return false
    end
end

isbetween(3,6,9)


#########################
# Exercise 6.4          #
#########################
function b(z)
    prod = a(z, z)
    println(z, " ", prod)
    return prod
end

function a(x, y)
    x = x + 1
    val = x * y
    return val
end

function c(x, y, z)
    total = x + y + z
    square = b(total)^2
    return square
end

x = 1
y = x + 1
println(c(x, y + 3, x + y))


#########################
# Exercise 6.5          #
#########################
function ack(m, n)
    if m == 0
        val = n + 1
        return val

    elseif m > 0 && n == 0
        val = ack(m-1, 1)
        return val

    elseif m > 0 && n > 0
        val = ack(m-1, ack(m, n-1))
        return val
    end
end

ack(3, 4)


#########################
# Exercise 6.6          #
#########################
function first(word)
    first_letter_index = firstindex(word)
    first_letter = word[first_letter_index]
    return first_letter
end

function last(word)
    last_letter_index = lastindex(word)
    last_letter = word[last_letter_index]
    return last_letter
end

function middle(word)
    first_letter_index = firstindex(word)
    last_letter_index = lastindex(word)
    middle_string = word[nextind(word, first_letter_index) : prevind(word, last_letter_index)]
    return middle_string
end

first("aardappel")
last("aardappel")
middle("aardappel")

#-------------------------------------------------------------
function ispalindrome(word)
    if first(word) == last(word) && middle(word) != ""
        ispalindrome(middle(word))
    elseif first(word) == last(word) && middle(word) == ""
        return true
    else
        return false
    end
end

ispalindrome("aardappel")
ispalindrome("lepel")


#########################
# Exercise 6.7          #
#########################
function ispower(a, b)
    if a == b
        return true
    elseif a % b == 0 && ispower(a/b, b)
        return true
    else
        return false
    end
end

ispower(125, 5)


#########################
# Exercise 6.8          #
#########################
function gcd(a, b)

    if a != 0 && b!= 0
        r = a % b

        if r == 0
            return min(a, b)
        else
            gcd(min(a, b), r)
        end

    elseif a == 0 || b == 0
        return max(a, b)
    end

end


gcd(3, 225)


