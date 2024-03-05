=begin

Typically, ruby assigns arguments with no defaults from left to right.
If 3 arguments are passed to a method however, ruby will assign the first 
argument to the first parameter, and the third argument to the last parameter.
The remaining argument(s) are assigned to parameters with no default values.
If none exist, the argument is assigned to the next consecutive variable from
left to right.
Because 3 arguments are provided, the first and last parameters will be
assigned to 4 and 6, respectively. Because the remaining parameters are
assigned default values, the argument 5 is assigned to the next consectutive
parameter, b.

[4, 5, 3, 6]

=end