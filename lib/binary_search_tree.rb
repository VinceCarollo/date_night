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

  def depth_of(value)
    depth = 0
    pointer = @head
    until pointer.nil? || pointer.value == value
      if value < pointer.value
        pointer = pointer.left
        depth += 1
      else
        pointer = pointer.right
        depth += 1
      end
    end
    if pointer.nil?
      nil
    else
      depth
    end
  end

  def max
    pointer = @head
    until pointer.right.nil?
      pointer = pointer.right
    end
    { pointer.title => pointer.value }
  end

  def min
    pointer = @head
    until pointer.left.nil?
      pointer = pointer.left
    end
    { pointer.title => pointer.value }
  end

  def load(path)
    movie_count = 0
    File.readlines('movies.txt').each do |line|
      movie_count += 1
      movie_data = line.gsub("\n", '').split(', ')
      insert(movie_data[0].to_i, movie_data[1])
    end
    movie_count
  end

  def sort
    sorted = {}
    sorted[@head.title] = @head.value
    pointer = @head
    until pointer.left.nil?
      pointer = pointer.left
      sorted[pointer.title] = pointer.value
    end
    pointer = @head
    until pointer.right.nil?
      pointer = pointer.right
      sorted[pointer.title] = pointer.value
      if pointer.left
        sorted[pointer.title] = pointer.value
      end
    end
    binding.pry
  end

end
