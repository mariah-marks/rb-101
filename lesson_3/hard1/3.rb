=begin

 A)
 Local method variables `one`, `two` and `three` are each assigned to new string
 objects within the method. The values referenced by these local variables will
 remain the same.

   one is: one
   two is: two
   three is: three
   => nil

 B)
 As with the previous example, simple assignment within the method won't
 mutate the calling objects.

   one is: one
   two is: two
   three is: three
   => nil

 C)
 The mutating gsub! method will modify the values referenced by local method
 variables `one`, `two` and `three`.

   one is: two
   two is: three
   three is: one
   => nil

=end
