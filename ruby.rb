module Comparable
    def compare(num, comp)
        num < comp ? left : right
    end
end

class Node
    attr_accessor :left, :value, :right

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end

class Tree
    include Comparable

    attr_accessor :root

    def initialize(array)
        @root = build_tree(array)
        @queue = []
    end

    def build_tree(array)
        root = Node.new(array[0])
        array.each do |n|
            insert(root, n)
        end
        return root
    end

    def insert(node, value)
        if value == node.value #removes duplicates
        elsif value > node.value 
            if node.right
                insert(node.right, value)
            else
                node.right = Node.new(value)
            end
        else
            if node.left
                insert(node.left, value)
            else
                node.left = Node.new(value)
            end
        end
    end

    def delete(key, root = @root)
        if root == nil
            return nil
        elsif key < root.value
            root.left = delete(key, root.left)
        elsif key > root.value
            root.right = delete(key, root.right)
        else
            if (root.left == nil) 
                return root.right; 
            elsif (root.right == nil) 
                return root.left; 
            end
        end
        # node with two children: Get the inorder successor (smallest 
            # in the right subtree) 
            root = minValue(root.right); 
  
           # Delete the inorder successor 
            root.right = delete(root, root.right); 
    end

    def minValue(root)  # used for delete
        minv = root.value
        while root.left != nil
            minv = root.left.value
            root = root.left
        end
        return minv
    end

    def find(root, number)
        #root = @root
        if root == nil 
            return nil
        elsif number == root.value 
            return root
        elsif number < root.value  
            return find(root.left, number)
        elsif number > root.value
            return find(root.right, number)
        else 
            #why isnt this working???
        end
        puts "#{number} is not in this tree"
    end

    def level_order(root = @root)
        return nil if root == nil
        @queue.push(root)
        while @queue.length > 0
            current = @queue[0]
            print "( #{current.value} ) -> "
            @queue.push(current.left) if current.left 
            @queue.push(current.right) if current.right 
            @queue.shift
        end
    end

    def inorder(root)
        return if root == nil
        inorder(root.left)
        print "#{root.value} -> "
        inorder(root.right)
    end

    def preorder(root)
        return if root == nil
        print "#{root.value} -> "
        preorder(root.left)
        preorder(root.right)
    end 

    def postorder(root)
        return if root == nil
        postorder(root.left)
        postorder(root.right)
        print "#{root.value} -> "
    end

    def depth(node = @root) 
        return 0 if node == nil
        left_depth = depth(node.left)
        right_depth = depth(node.right)
        if left_depth > right_depth
            return left_depth + 1
        else 
            return right_depth + 1
        end
    end

    def balanced?()
        left_subtree = @root.left
        right_subtree = @root.right
        return (depth(left_subtree) - depth(right_subtree)).abs <= 1
    end

    def rebalance!(arr)
        halfway = arr.size/2.0
        arr.sort!
        arr1 = arr.slice(0, halfway)
        arr2 = arr.slice(halfway, halfway)
        arr = arr2 | arr1

        @root = build_tree(arr)
    end
end


arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324, 323]
tree = Tree.new(arr)

#tree = Tree.new(Array.new(15) { rand(1..100) })
tree.inorder(tree.root)
puts ""
puts tree.find(tree.root, 9)

puts "depth:"
print tree.depth(tree.root)
puts ""

#tree.delete(23)

tree.level_order(tree.root)
puts ""

puts tree.balanced?()
tree.rebalance!(arr)
puts tree.balanced?()

puts tree.depth