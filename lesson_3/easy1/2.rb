=begin

1. != returns a boolean value if two items are not equal.

2. ! before a variable will return a boolean true or false that is opposite
   the object being referenced (a truthy value will return a boolean false and
   vice versa)

3. a bang operator at the end of the method name usually indiates the method
  will mutate the calling object, but some mutating methods don't include a !.

4. using ? before something indicates a ternary expression. Ternerary
   expressions should be used when selecting between values, rather than
   actions.

5. If not in a ternary expression, ? after something indicates a method that
   evaluates an input.

6. !! before something like a variable will return a boolean object, true if the
   object referenced is truthy, or false if the object referenced is false or
   nil.

=end
