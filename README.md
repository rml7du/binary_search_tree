# binary_search_tree
odin project binary search tree


Assignment 1
You’ll build a simple binary search tree in this assignment. In this lesson, our tree won’t handle duplicate values as they are more complicated and result in trees that are much harder to balance. Be sure to always remove duplicate values or check for an existing value before inserting.

Build a Node class. It is should have attributes for the data it stores as well as its left and right children. As a bonus, try including the Comparable module and make nodes compare using their data attribute.

Build a Tree class which accepts an array when initialized. The Tree class should have a root attribute which uses the return value of #build_tree which you’ll write next.

Write a #build_tree method which takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a balanced binary tree full of Node objects appropriately placed (don’t forget to sort and remove duplicates!). The #build_tree method should return the level-1 root node.

Write an #insert and #delete method which accepts a value to insert/delete (you’ll have to deal with several cases for delete such as when a node has children or not).

Write a #find method which accepts a value and returns the node with the given value.

Write a #level_order method which accepts a block. The method should traverse the tree in breadth-first level order and yield each node to the provided block. This method can be implemented using either iteration or recursion (try implementing both!). As a bonus, make the method return an array of values if no block is given. Tip: You will want to use an array acting as a queue to keep track of all the child nodes that you have yet to traverse and to add new ones to the list (as you saw in the video).

Write #inorder, #preorder, and #postorder methods which accept a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. As a bonus, make the method return an array of values if no block is given.

Write a #depth method which accepts a node and returns the depth(number of levels) beneath the node.

Write a #balanced? method which checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree is not more than 1.

Write a #rebalance! method which rebalances an unbalanced tree. Tip: You’ll want to create a level-order array of the tree before passing the array back into the #build_tree method.

Write a simple driver script that does the following:

1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
2. Confirm that the tree is balanced by calling `#balanced?`
3. Print out all elements in level, pre, post, and in order
4. try to unbalance the tree by adding several numbers > 100
5. Confirm that the tree is unbalanced by calling `#balanced?`
6. Balance the tree by calling `#rebalance!`
7. Confirm that the tree is balanced by calling `#balanced?`
8. Print out all elements in level, pre, post, and in order
Pat yourself on the back! As a super-duper bonus, notice how all the depth-first methods share a similar signature and are basically just a re-arrangement of the same 3 lines… try dynamically declaring the three methods using metaprogamming techniques like #define_method.