# The method `mess_with_it` reassigns method local variable to the return value
# of the Integer+ method with `42` and `8` as arguments. Because numbers are
# immutable in ruby, `some_number` is reassigned to reference a new integer
# object with the value 50. The value referenced by `answer` isn't mutated.

# When the `p` method is invoked and passed Integer#- with two arguments, the
# number output will be 34.

# 34
# => 34
