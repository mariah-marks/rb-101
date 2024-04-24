# input: positive integer
# output: right triangle of asterisks

# Rules:
# - the length and width of the triangle are integer asterisks long
# - the first line of the triangle is integer - 1 spaces and 1 asterisk
# - each line decrements number of spaces from the previous line by one,
# -- and increments number of * from the previous line by 1
# - the last line is all asterisks and no spaces

# Given a positive integer:
# - create an empty array
# - create variables:
# -- star_count and initialize it to reference 1
# -- space_count and initialize it to reference integer - 1
# - append space_count number of spaces to array
# - append star_count stars number of spaces to array

# - On each iteration:
# -- increment star_count by one
# -- decrement space_count by one
# - reassign array index 0 to space_count number of spaces
# - reassign array index 1 to star_count number of stars
# - output array values without brackets or qoutation marks
# - exit iteration when star_count equals integer

def triangle(num)
  arr = []
  star_count = 1
  space_count = num - 1

  arr << (" " * space_count)
  arr << ("*" * star_count)
  puts arr.join

  until star_count == num
    star_count += 1
    space_count -= 1
    arr[0] = (" " * space_count)
    arr[1] = ("*" * star_count)
    puts arr.join
  end
end

triangle(6)
triangle(20)

# further exploration:

def inverted_triangle(num)
  arr = []
  star_count = num
  space_count = num - star_count

  arr << ("*" * star_count)
  arr << (" " * space_count)
  puts arr.join

  until star_count == 1
    star_count -= 1
    space_count += 1
    arr[0] = ("*" * star_count)
    arr[1] = (" " * space_count)
    puts arr.join
  end
end

def inverted_flipped_triangle(num)
  arr = []
  star_count = num
  space_count = 0

  arr << ("*" * star_count)
  arr << (" " * space_count)
  puts arr.join

  until star_count == 1
    star_count -= 1
    space_count += 1
    arr[0] = (" " * space_count)
    arr[1] = ("*" * star_count)
    puts arr.join
  end
end

def flipped_triangle(num)
  arr = []
  star_count = 1
  space_count = num - star_count

  arr << ("*" * star_count)
  arr << (" " * space_count)
  puts arr.join

  until star_count == num
    star_count += 1
    space_count -= 1
    arr[0] = ("*" * star_count)
    arr[1] = (" " * space_count)
    puts arr.join
  end
end

def any_corner_triangle(num, type)
  case type
  when "bottom_right"
    triangle(num)
  when "top_right"
    inverted_flipped_triangle(num)
  when "bottom_left"
    flipped_triangle(num)
  when "top_left"
    inverted_triangle(num)
  end
end

any_corner_triangle(8, "bottom_right")
any_corner_triangle(8, "bottom_left")
any_corner_triangle(8, "top_right")
any_corner_triangle(8, "top_left")
