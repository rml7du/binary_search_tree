require_relative 'ruby.rb'

#1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
tree = Tree.new(Array.new(15) { rand(1..100) })

#2. Confirm that the tree is balanced by calling `#balanced?`
puts tree.balanced?()

#3. Print out all elements in level, pre, post, and in order
puts tree.level_order()
puts tree.preorder()
puts tree.inorder()
puts tree.postorder()

#4. try to unbalance the tree by adding several numbers > 100
tree.insert(120)
tree.insert(150)
tree.insert(103)
tree.insert(510)
tree.insert(1000)
tree.insert(1001)
tree.insert(1000000)
tree.insert(101)
tree.insert(125)

#5. Confirm that the tree is unbalanced by calling `#balanced?`
puts tree.balanced?()

#6. Balance the tree by calling `#rebalance!`
tree.rebalance!()

#7. Confirm that the tree is balanced by calling `#balanced?`
puts tree.balanced?()

#8. Print out all elements in level, pre, post, and in order
puts tree.level_order()
puts tree.preorder()
puts tree.inorder()
puts tree.postorder()