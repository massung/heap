# Binary Heap for Common Lisp

Simple implementation of a [binary heap](https://en.wikipedia.org/wiki/Binary_heap) for Common Lisp. Very useful for priority queues, etc.

## Quickstart

To create a new heap, use the `make-heap` function.

    (make-heap test &key key initial-contents)

All heaps require a *test* function that is used much in the same way a sort function is used. It compares two elements in the heap to determine which should be closer to the top of the heap.

For example...

    CL-USER > (make-heap #'> :initial-contents '(1 2 3))
    #<HEAP 3 items>

    CL-USER > (heap-pop *)
    3

    CL-USER > (make-heap #'< :initial-contents '(1 2 3))
    #<HEAP 3 items>

    CL-USER > (heap-pop *)
    1

If you are storing objects in your heap, the *key* can be used to in the same way `find` and other Common Lisp functions use the *key* to extract the pertinent information from each element.

    CL-USER > (make-heap #'> :key #'car :initial-contents '((1 a) (2 b)))
    #<HEAP 2 items>

    CL-USER > (heap-pop *)
    (2 B)

The *initial-contents* can be any sequence.

Once you have a heap, you can add items to it with `heap-push` and remove items from it with `heap-pop`.

    CL-USER > (setf h (make-heap #'>))
    #<HEAP 0 items>

    CL-USER > (heap-push 10 h)
    #<HEAP 1 items>

    CL-USER > (heap-pop h)
    10

*NOTE: Be sure and only push items into the heap that can abide by the key and test functions used when creating the heap.*

Popping items from an empty heap returns NIL.

    CL-USER > (heap-pop (make-heap #'<))
    NIL

You can look at the top item in the heap (without popping it) with `heap-peek`.

    CL-USER > (heap-peek (make-heap #'> :initial-contents '(1 2 3)))
    3

Removing all elements from the heap can be done with with `heap-flush`.

    CL-USER > (heap-flush (make-heap #'< :initial-contents '(1 2 3)))
    NIL

Finally, you can get a copy of all the items in the heap with `heap-contents`. This will return a simple-vector.

    CL-USER > (heap-contents (make-heap #'> :initial-contents '(1 2 3)))
    #(3 1 2)

*Note: The items returned may not be in any discernable order!*
