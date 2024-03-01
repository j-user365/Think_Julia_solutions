#########################
# Exercise 2.1          #
#########################
5
x = 5
x + 1


#########################
# Exercise 2.2          #
#########################
n = 42

#-------------------------------------------------------------
x = y = 1

#-------------------------------------------------------------
n = 42;

# creates a double
n = 42.

#-------------------------------------------------------------
x*y

5x


#########################
# Exercise 2.3          #
#########################
function sphere_volume(r)
    # both pi and π work
    volume = 4/3 * pi * r^3
    return(volume)
end

sphere_volume(5)

#-------------------------------------------------------------
function wholesale(copies)
    books = 24.95 * (1 - 0.4) * copies
    shipping = 3 + (copies - 1) * 0.75
    wholesale = books + shipping
    return(wholesale)
end

wholesale(60)

#-------------------------------------------------------------
time_dec_start = 6 + 52/60
runtime_dec = (2 * (8 + 15/60) + 3 * (7 + 12/60)) / 60
time_dec_end = time_dec_start + runtime_dec

time_end_hours = div(time_dec_end, 1)
time_end_hours = trunc(time_dec_end)
time_end_minutes = div((time_dec_end - time_end_hours) * 60, 1)
time_end_seconds = ((time_dec_end - time_end_hours) * 60 - time_end_minutes) * 60