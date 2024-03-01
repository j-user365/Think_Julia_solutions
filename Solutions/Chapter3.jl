#########################
# Exercise 3.1          #
#########################
function printlyrics()
    println("I'm a lumberjack, and I'm okay.")
    println("I sleep all night and I work all day.")
end

function repeatlyrics()
    printlyrics()
    printlyrics()
end

repeatlyrics()


#########################
# Exercise 3.2          #
#########################
function rightjustify(s)
    length_s = length(s)
    spaces = " " ^ (70-length_s)
    println(spaces * s)
end

rightjustify("Hallo")

length("Hallo")


#########################
# Exercise 3.3          #
#########################
function dottwice(f)
    f()
    f()
end

function printspam()
    println("spam")
end

dottwice(printspam)

#-------------------------------------------------------------
function dottwice(f, value)
    f(value)
    f(value)
end

#-------------------------------------------------------------
function printtwice(bruce)
    println(bruce)
    println(bruce)
end

#-------------------------------------------------------------
dottwice(printtwice, "spam")

#-------------------------------------------------------------
function dofour(func, value)
    dottwice(func, value)
    dottwice(func, value)
end


#########################
# Exercise 3.3          #
#########################
function printgrid(num)
    corner = "+"
    row_line = corner * " - - - - +"^num

    row_side = "|"
    row_empty = row_side * "         |"^num * "\n"

    row_block = row_empty^4 * row_line * "\n"
    
    println(row_line)
    println(row_block^num)

end

printgrid(4)
