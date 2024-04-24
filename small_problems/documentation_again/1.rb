=begin

The primary difference is that File::path is a class method and File#path
is an instance method. Class methods are invoked on the class itself,
where instance methods are invoked on an object or instance of that class.

The signature for the class method File::path shows that the method accepts
one argument (path), and returns a string representation of the given argument.

The signature for the instance method File#path shows that the method accepts
an object (or instance of the file class) as an argument, and returns a string.

=end
