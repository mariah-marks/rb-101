=begin

Using the find-minimum mode, the binary search method requires a block that
will evaluate as true or false. In the block, we can use the expression, 
x > 8, and the method will return the first value for which this
condition evaluates as true.
The return value is assigned to a variable and then displayed to output.

value = a.bsearch { |num| num > 8 }
puts value

=end