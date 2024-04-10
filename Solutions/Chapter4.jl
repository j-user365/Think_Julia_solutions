using Pkg

Pkg.add(url = "https://github.com/BenLauwens/ThinkJulia.jl")

using ThinkJulia


#########################
# Exercise 4.1          #
#########################
🐢 = Turtle()

@svg begin
    forward(🐢, 100)
    for i in 1:3
        turn(🐢, -90)
        forward(🐢, 100)
    end
end


@svg begin
    for i in 1:4
        forward(🐢, 100)
        turn(🐢, -90)
    end
end


#########################
# Exercise 4.2          #
#########################
function square(t)
        for i in 1:4
            forward(t, 100)
            turn(t, -90)
        end
end


#########################
# Exercise 4.3          #
#########################
@svg begin
    square(🐢)
end


#########################
# Exercise 4.4          #
#########################
function square(t, len)
    @svg begin
        for i in 1:4
            forward(t, len)
            turn(t, -90)
        end
    end
end

square(🐢, 10)
square(🐢, 100)
square(🐢, 150)


#########################
# Exercise 4.5          #
#########################
function polygon(t, len, n)
    angle = 360/n
    @svg begin
        for i in 1:n
            forward(t, len)
            turn(t, -angle)
        end
    end
end

polygon(🐢, 50, 10)


#########################
# Exercise 4.6          #
#########################
function circle(t, r)
    n = trunc(10*r)
    circ = 2*r*pi
    len = circ/n
    polygon(t, len, n)
end

circle(🐢, 100)


#########################
# Exercise 4.7          #
#########################
function arc(t, r, angle)
    n = 10*r
    circ = 2*r*pi
    len = circ/n

    arc = trunc(n * angle / 360)
    turt_angle = 360/n
    @svg begin
        for i in 1:arc
            forward(t, len)
            turn(t, -turt_angle)
        end
    end
end

arc(🐢, 100, 90)

#-------------------------------------------------------------
function polyline(t, n, len, angle)
    for i in 1:n
        forward(t, len)
        turn(t, -angle)
    end
end

@svg begin
    polyline(🐢, 3, 100, 45)
end


function polygon(t, n, len)
    angle = 360 / n
    polyline(t, n, len, angle)
end

@svg begin
    polygon(🐢, 5, 100)
end


function arc(t, r, angle)
    arc_len = abs(2*r*pi*angle/360)
    n = trunc(abs(10*r*angle/360))
    step_len = arc_len/n
    step_angle = angle/n
    polyline(t, n, step_len, step_angle)
end

@svg begin
    arc(🐢, 100, 180)
end


function circle(t, r)
    arc(t, r, 360)
end

@svg begin
    circle(🐢, 100)
end


#########################
# Exercise 4.8          #
#########################
# see page 45-46


#########################
# Exercise 4.9          #
#########################
function flower(t, petals, overlap = 1)
    r = 30*(petals/2)/overlap
    angle = 360/(petals)*overlap

    for i in 1:petals
        arc(t, r, angle)
        turn(🐢, -180+angle)
        arc(t, r, angle)
        turn(🐢, -180+angle)
        turn(🐢, angle)
    end


end

🐢 = Turtle()
@svg begin
    flower(🐢, 8, 3)
end


#########################
# Exercise 4.10         #
#########################
function polygon_triangle(t, n, len = 100)
    angle = 360/n

    # length side of polygon
    circ = 2*len*sin(pi/n)

    for i in 1:n
        forward(t, len)
        turn(t, -90-1/2*angle)
        forward(t, circ)
        turn(t, -90-angle/2)
        forward(t, len)
        turn(t, 180)
    end
end

🐢 = Turtle()
@svg begin
    polygon_triangle(🐢, 8)
end


#########################
# Exercise 4.11         #
#########################
function draw_a(t, len)
    forward(t, len/1.5)
    arc(t, len/3, -90)
    forward(t, len/1.5)
    arc(t, len/3, -90)
    forward(t, len/2)
    arc(t, len/3, -180)
    forward(t, len/2+len/3)
end

🐢 = Turtle()
@svg begin
    draw_a(🐢, 100)
end

# and so on...


#########################
# Exercise 4.12         #
#########################
function spiral(t, radius_factor, radius_decrease, angle, spiral_length)

    for i in 1:spiral_length

        r = radius_factor*angle

        arc(t, r, -angle)

        radius_factor = radius_factor*radius_decrease
    end
end

🐢 = Turtle()
@svg begin
    turn(🐢, 180)
    spiral(🐢, 1.5, 0.9, 75, 15)
end