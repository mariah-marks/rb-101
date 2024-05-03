advice = "Few things in life are as important as house training your pet \
  dinosaur."
advice.slice!("Few things in life are as important as ")

# Bonus

# String#slice returns a new string object. Using this method would return the
# string "Few things in life are as important as ", but the advice variable
# would still reference the same, unmutated string that was initialized on line
# 1.
