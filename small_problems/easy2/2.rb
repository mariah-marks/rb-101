# Given length and width in meters:
# - calulate are in square meters
# - calculate area in square feet
# - display results

def prompt(input)
  puts ">> #{input}"
end

prompt "Please provide the length of your room (in meters):"
room_length = gets.chomp

prompt "Please provide the width of your room (in meters):"
room_width = gets.chomp

area_meters = room_length.to_f * room_width.to_f

area_feet = area_meters * 10.7639

prompt "The area of the room is #{area_meters} square meters and \
(#{format('%.2f', area_feet)} square feet)."
