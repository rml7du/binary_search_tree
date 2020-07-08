class Node
    attr_accessor :left, :value, :right

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root

    def initialize(array)
        @array = array.sort.uniq
        @root = build_tree(@array)
        @queue = []
    end

    def build_tree(array)
        return nil if array.empty?
        center = array.length/2
        node = Node.new(array[center])
        node.left = build_tree(array[0...center])
        node.right = build_tree(array[center + 1..-1])
        node
    end

    def insert(value, node = @root)
        case value <=> node.value
        when -1
          node.left ? insert(value, node.left) : node.left = Node.new(value)
        when 0
          return "duplicate"
        when 1
          node.right ? insert(value, node.right) : node.right = Node.new(value)
        end
    end

    def delete(key, node = @root) #needs to be corrected
        if node == nil
            return nil
        elsif key < node.value
            delete(key, node.left)
        elsif key > node.value
            delete(key, node.right)
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

    def minValue(node = @root)  # used for delete
        minv = node.value
        while node.left != nil
            minv = node.left.value
            node = node.left
        end
        return minv
    end

    def find(data, node = @root)
        if node == nil 
            return nil
        elsif data == node.value 
            return node.value
        elsif data < node.value  
            return find(data, node.left)
        elsif data > node.value
            return find(data, node.right)
        else
            puts "#{number} is not in this tree" 
            #why isnt this working???
        end
    end

    def level_order(node = @root)
        return nil if node == nil
        @queue.push(node)
        while @queue.length > 0
            current = @queue[0]
            print "#{current.value} -> "
            @queue.push(current.left) if current.left 
            @queue.push(current.right) if current.right 
            @queue.shift
        end
    end

    def level_order_rebal(node = @root) #for rebalance
        return nil if node == nil
        output = []
        @queue.push(node)
        while @queue.length > 0
            current = @queue[0]
            output.push(current.value) #for rebalance
            @queue.push(current.left) if current.left 
            @queue.push(current.right) if current.right 
            @queue.shift
        end
        output
    end

    def inorder(node = @root)
        return if node == nil
        inorder(node.left)
        print "#{node.value} -> "
        inorder(node.right)
    end

    def preorder(node = @root)
        return if node == nil
        print "#{node.value} -> "
        preorder(node.left)
        preorder(node.right)
    end 

    def postorder(node = @root)
        return if node == nil
        postorder(node.left)
        postorder(node.right)
        print "#{node.value} -> "
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

    def rebalance!()  
        output = level_order_rebal()
        @root = build_tree(output.sort.uniq)
    end
end