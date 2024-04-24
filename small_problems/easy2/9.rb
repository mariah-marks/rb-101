# On line one, local variable name is initialized to reference a String object
# with the value "Bob". On line two, local variable save_name is initialized to
# reference the value referenced by the name variable.

# On line 4, the upcase! method is called on the string referenced by
# local variable name. This method mutates it's argument by converting all
# lowercase letters to uppercase letters and returns a mutated version of the
# string.

# When the puts method is invoked and the values referenced by name and
# save_name are passed as arguments, we should expect the following output:

# BOB
# BOB
# => nil

# On line 2, save_name is initialized as an alias to the name variable, meaning
# that both variables now reference the same object. Because upcase! is a
# mutating method, it doesn't matter which variable is passed to the method at
# invocation, because the object referenced by both variables is being mutated.
