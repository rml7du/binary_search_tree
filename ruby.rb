module Comparable

end

class Node
    attr_accessor :next_node, :value

    def initialize(value)
        @value = value
        @left = nil
        @right = nil
    end
end

class Tree
    attr_accessor :root

    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array)
    end

    def insert()
    end

    def delete()
    end

    def find()
    end

    def inorder() 
    end

    def preorder()
    end 

    def postorder()
    end

    def depth()
    end

    def balanced?()
    end

    def rebalance!()
    end
end

tree = Tree.new( [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324] )
tree.build_tree()