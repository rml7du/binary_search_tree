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
        root = Node.new(array.shift)
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

    def delete()
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

    def level_order(root)
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

    def depth(node)
        return 0 if node == nil
        left_depth = depth(node.left)
        right_depth = depth(node.right)
        if left_depth > right_depth
            return left_depth + 1
        else return right_depth + 1
        end
    end

    def balanced?()
    end

    def rebalance!()
    end
end

tree = Tree.new( [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324] )
tree.inorder(tree.root)
puts ""
puts tree.find(tree.root, 9)

puts "depth:"
print tree.depth(tree.root)
puts ""

tree.level_order(tree.root)
puts ""