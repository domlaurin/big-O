anagrams 1

permutations

O(n!)

anagrams 2

nested loops

O(n^2)

anagrams 3

sort - which uses quicksort

O(n log n)

anagrams 4

store letters as 2 hashes 

O(n)

-----------------
big O project 3

Brute force

first idea:
nested loop O(n^2)

arr = [0, 1, 5, 7]
two_sum?(arr, 6) # => should be true
two_sum?(arr, 10) # => should be false

Sorting

sorting makes time complexity at least n log n 
use binary search to find target minus current element?

Hash map

store every ele as a key in a hash
check if target minus current element is a key in the hash
O(n)



