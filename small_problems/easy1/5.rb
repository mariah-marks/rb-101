# input: string
# output: string printed inside box

# Rules:
# - the box has to be two lines longer and two spaces wider than the length
# - of the string.
# - The string has to be centered inside the box.
# - The total output has to contain 5 lines.
# - The string length doesn't exceed 76 characters.

# Given a string:
# - create variable named horizontal_edge which references the string "+--+"
# -- insert "-" at space 2 for each character in string.
# - initialize a variable named blank_line which references the string "|  |"
# -- insert " " at space 2 for each character in string.
# - initialize a variable named text_line which references the string "|  |"
# -- interpolate the value referenced by string in text_line

# output horizontal_edge
# output blank_line
# output text_line
# output blank_line
# output horizontal_edge

def print_box(text)
  horizontal_edge = "+-#{'-' * text.length}-+"
  blank_line = "| #{' ' * text.length} |"
  text_line = "| #{text} |"

  puts horizontal_edge
  puts blank_line
  puts text_line
  puts blank_line
  puts horizontal_edge
end
