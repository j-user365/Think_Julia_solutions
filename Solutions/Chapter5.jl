#########################
# Exercise 5.1          #
#########################
function do_n(object, n)
    if n < 0
        return
    else
        object()
    end
end


#########################
# Exercise 5.2          #
#########################
function time_now()
    current_time_s = time()
    current_time_m = current_time_s/60
    current_time_h = current_time_m/60
    current_time_d = current_time_h/24
    
    hour = (current_time_d - trunc(current_time_d))*24
    minutes = (hour - trunc(hour))*60
    seconds = (minutes - trunc(minutes))*60
    
    print(trunc(Int, hour), ":", trunc(Int, minutes), ":", trunc(Int, seconds))
end

time_now()


#########################
# Exercise 5.3          #
#########################
function checkfermat(a, b, c, n)
    left = a^n + b^n
    right = c^n

    if left == right
        println("Holy smokes, Fermat wat wrong!")
    else
        println("No, that doesn't work.")
    end
end


function fermet_user()
    println("Give a value for 'a':"); a = readline()
    a = parse(Int64, a)

    println("Give a value for 'b':"); b = readline()
    b = parse(Int64, b)

    println("Give a value for 'c':"); c = readline()
    c = parse(Int64, c)

    println("Give a value for 'n':"); n = readline()
    n = parse(Int64, n)

    checkfermat(a, b, c, n)
end

fermet_user()


#########################
# Exercise 5.4          #
#########################
function istriangle(a, b, c)
    num_ordered = sort([a, b, c])

    if num_ordered[3] > num_ordered[1] + num_ordered[2]
        println("No")
    else
        println("Yes")
    end
end

function istriangle_user()
    println("Give a first length:"); a = readline()
    a = parse(Int64, a)

    println("Give a second length:"); b = readline()
    b = parse(Int64, b)

    println("Give a third length:"); c = readline()
    c = parse(Int64, c)

    istriangle(a, b, c)
end


istriangle_user()


#########################
# Exercise 5.5          #
#########################
function recurse(n, s)
    if n == 0
        println(s)
    else
        recurse(n-1, n+s)
    end
end

recurse(5, 0)


#########################
# Exercise 5.6          #
#########################
using ThinkJulia

function draw(t, length, n)
    if n == 0
        return
    end

    angle = 50
    forward(t, length*n)
    turn(t, -angle)
    draw(t, length, n-1)
    turn(t, 2*angle)
    draw(t, length, n-1)
    turn(t, -angle)
    forward(t, -length*n)
end

t = Turtle()
@svg begin
    draw(t, 10, 2)
end


#########################
# Exercise 5.7          #
#########################
function kochcurve(t, length, n)

    if n == 0
        forward(t, length)
        # end the loop with return or put remaidner of code in 'else' loop (see below)
        return
    end

    angle = 60

    kochcurve(t, length/3, n-1)
    turn(t, -angle)
    kochcurve(t, length/3, n-1)
    turn(t, 2*angle)
    kochcurve(t, length/3, n-1)
    turn(t, -angle)
    kochcurve(t, length/3, n-1)
end

@svg begin
    t = Turtle()
    kochcurve(t, 300, 5)
end


function koch_curve(t, order, length)
    if order == 0
        forward(t, length)
    else
        koch_curve(t, order-1, length/3)
        turn(t, 60)
        koch_curve(t, order-1, length/3)
        turn(t, -120)
        koch_curve(t, order-1, length/3)
        turn(t, 60)
        koch_curve(t, order-1, length/3)
    end
end

#-------------------------------------------------------------
function snowflake(t, length, n)

    angle = 60

    for _ in 1:3
        kochcurve(t, length, n)
        turn(t, 2*angle)
    end
end

@svg begin
    t = Turtle()
    snowflake(t, 250, 5)
end

#-------------------------------------------------------------
# Get all names exported by the package
exported_names = names(ThinkJulia)
println(exported_names)
