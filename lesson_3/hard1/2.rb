# On line two, `informal_greeting` is initilized to reference
# the value returned by calling Hash#[] method on the greetings hash and
# passing `:a` as an argument. This method returns the value referenced by the
# key `a:`, which is a string object with the value "hi".

# Because `informal_greeting` points to the original object, when the mutating
# String#<< method is invoked on line 11, the mutation is reflected in the value
# referenced by `greetings[:a].

# puts greetings # { a: "hi there" }
