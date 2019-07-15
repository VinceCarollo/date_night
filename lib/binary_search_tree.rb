require 'pry'

class BinarySearchTree

  def initialize
    @head = nil
  end

  def insert(value, title)
    depth = 0
    if @head
      depth += 1
      pointer = @head
      if value > pointer.value
        until pointer.right.nil?
          pointer = pointer.right
          depth += 1
        end
        if value > pointer.value
          pointer.right = Node.new(value, title)
        else
          pointer.left = Node.new(value, title)
        end
        depth
      elsif value < pointer.value
        until pointer.left.nil?
          pointer = pointer.left
          depth += 1
        end
        if value > pointer.value
          pointer.right = Node.new(value, title)
        else
          pointer.left = Node.new(value, title)
        end
        depth
      end
    else
      @head = Node.new(value, title)
      depth
    end
  end

  def include?(value)
    pointer = @head
    until pointer.value == value
      if value < pointer.value
        pointer = pointer.left
      else
        pointer = pointer.right
      end
      break if pointer.right.nil? && pointer.left.nil?
    end
    pointer.value == value
  end

end
