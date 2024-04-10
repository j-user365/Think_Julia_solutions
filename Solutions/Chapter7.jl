#########################
# Exercise 7.1          #
#########################
# Original function with recursion
function printn(s, n)
    if n <= 0
        return
    end
    println(s)
    printn(s, n-1)
end

printn(4, 5)

#-------------------------------------------------------------
# New function with iteration
function new_printn(s, n)
    while n > 0
        println(s)
        n = n - 1
    end
end

new_printn(4, 5)


#########################
# Exercise 7.2          #
#########################
function mysqrt(a)

    ε = 0.000000000000001
    x = a/2 + a/4

    while true
        y = (x + a/x)/2

        if abs(y - x) < ε
            break
        end
        
        x = y
    end
    
    return x

end

mysqrt(13)


function testsquareroot(max_a)

    if (max_a > 0) & (max_a isa Int64)
        println("a\tmysqrt\t\t\tsqrt\t\t\tdiff")
        println("-\t------\t\t\t----\t\t\t----")

        for i in 1:max_a
            val = Float64(0)

            try
                val = convert(Int, round(mysqrt(i), digits = 5))
            catch
                val = mysqrt(i)
            end


            diff = abs(mysqrt(i) - sqrt(i))

            if val isa Int64
                println(i, "\t", mysqrt(i), "\t\t\t", sqrt(i), "\t\t\t", diff)
            else
                println(i, "\t", mysqrt(i), "\t", sqrt(i), "\t", diff)
            end

        end

    else

    println("This is not a positive integer.")

    end
end

testsquareroot(9)


#########################
# Exercise 7.3          #
#########################
function evalloop()

    while true
        print(">")
        text = readline()

        if (text == "Done") || (text == "done")
            break
        end

        expr = Meta.parse(text)
        val = eval(expr)
        println(val)
    end

    return
end

evalloop()


#########################
# Exercise 7.4          #
#########################
function estimatepi(precision)

    start = 1

    val = 0
    k = 0

    while start > precision

        # Als k te groot wordt fout door overflow in Int64, BigInt lost dit op
        x = (factorial(4*k) * (1103 + 26390*k) / (factorial(k)^4 * BigInt(396)^(4*k))) * 2 *sqrt(2) / 9801
        val = val + x
        k = k + 1

        start = x
    end

    return val
end

# Funcie schat 1/pi
1/estimatepi(10^(-15))
pi
