=begin

Array#delete_at removes the object at a given index, and returns the object that
was removed. If the given index is outside of the array range, it returns nil.

  numbers.delete_at(1)
  => 2

Array#delete removes all instances of an object from the collection, and returns
the object removed. If there are no instances of the given object in the
collection, it returns nil.

  numbers.delete(1)
  =>

Both methods mutate the calling array.

=end
