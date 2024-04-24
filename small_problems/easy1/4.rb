# input: positive integer and boolean
# output: integer divided by 2 if true, 0 if false

# Given a positive integer and a boolean
# - if the boolean is true, return the result of dividing the integer by two.
# - Otherwise, return 0

=begin

START

  IF boolean = true
    return integer / 2
  ELSE
    return 0

END

=end

def calculate_bonus(num, boolean)
  boolean ? (num / 2) : 0
end
