# On line one, we have a method definition with two parameters. The
# first local method variable is reassigned to the value referenced by itself
# concatenated with the string "rutabaga". Reassignment is non-mutating, so a
# new string is returned.

# The second local method variable is concatenated using the shovel operator,
# which mutates the calling object.

# When these variables are interpolated and output on lines 10 and
# 11, `string_arg_one` will reference the original string object "pumpkins".
# The `string_arg_two` will reference a now mutated string object with the value
# "pumpkinsrutaba".

# String_arg_one looks like this now: pumpkins
# String_arg_two looks like this now: pumpkinsrutabaga
# => nil
