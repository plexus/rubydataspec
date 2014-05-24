An executable spec, benchmark and reference implementation for persistent Ruby data structure.

See [issues](https://github.com/plexus/rubydataspec/issues) for discussion about standardized interfaces.

## Vector

The first data type under scrutiny is the persistent vector.

Implementations involved:

* [Persistent::Vector](https://github.com/Who828/persistent_data_structures) A Java-native implementation for JRuby
* [Hamster::Vector](https://github.com/hamstergem/hamster) A pure ruby implementation
* [Clojr::Persistent::Vector](https://github.com/headius/clojr) A wrapper around Clojure's PersitentVector

Included is also `RubyData::PersistentVector`, a pure Ruby "simplest thing that could possibly work" implementation.

The proposed spec so far, for all persistent collections:

* `CollectionClass[1,2,3]` creates a new collection containing the given items.
* `inspect` returns a similar representation, `CollectionClass[1,2,3]`
* `eql?` checks for type and content, e.g. `Vector[1,2,3].eql?([1,2,3]) #=> false`, `Vector[1,2,3].eql?(Vector[1,2,3]) #=> true`
* `==` should follow Ruby type coercion rules, e.g. for vectors or lists it should call `to_ary` on an object that implements it. `Vector[1,2,3] == [1,2,3] #=> true`. Similarly a map should check for `to_hash`
* `add` adds an element to the collection in the most efficient way. For a cons-based list this means adding it to the front, for a vector it would add it to the back.

Other methods that should be implemented with the usual semantics: 'include?', 'each'.

In addition to the above, list-like data types like vectors or lists, should implement the following:

* `to_a`, `to_ary`, returning a plain Ruby array

In addition to all of the above, vectors should implement the following:

* `append`, e.g. `vector.append(4) #=> Vector[1,2,3,4]`
* `prepend`, e.g. `vector.prepend(4) #=> Vector[4,1,2,3]`

## Status

Currently implementing specs for the above, and preparing pull requests for the various projects to make them conforming.