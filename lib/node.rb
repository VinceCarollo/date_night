class Node
  attr_accessor :left, :right
  attr_reader :value, :title
  def initialize(value, title)
    @value = value
    @title = title
    @left = nil
    @right = nil
  end
end
