=begin

Date.civil is an alias for Date.new
Date::new returns a new instance of Date, with values delimited by dashes.
Date::new provides 4 default parameters:
year = -4712, month = 1, mday = 1, start = Date::Italy.

With no arguments, puts Date.new will return nil and print a string with the
default parameters as values:

-4712-1-1
=> nil

Outputs for passing multiple arguments:

puts Date.civil(2016)
2016-01-01
=> nil

puts Date.civil(2016, 5)
2016-05-01
=> nil

puts Date.civil(2016, 5, 13)
2016-05-13
=> nil

=end
