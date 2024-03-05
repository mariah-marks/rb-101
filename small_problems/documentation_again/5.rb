=begin

The documentation states that passing an invalid index will throw an 
IndexError exception, unless a default value is provided. Based on this
information, we can expect the first method call to raise an exception.

  (irb):4:in `fetch': index 7 outside of array bounds: -5...5 (IndexError)

The second method call will return the default value, given that the index 
provided is outside the array bounds.

  beats me
  => nil

The documentation states that when passing a block to the fetch method, the
block will only execute when the index is outside of array bounds. Because the
index referenced is still 7, the block returns the integer 49.

  49
  => nil

=end