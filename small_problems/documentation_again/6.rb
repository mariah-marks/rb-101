=begin
The documentation for Numeric#step shows the method accepts two optional
arguments, limit and step. Using the syntax with keyword arguments, the
documentation states that the block will increment the caller by step up to
limit, executing the block on each method call.

Passing the arguments (10, 3) on the 5.step method call will cause the block
to print 5 and 8, breaking the loop on the 3rd invokation, because 11 is
greater than limit.

  5
  8
  => nil

=end
