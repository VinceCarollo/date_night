require './lib/node'

RSpec.describe Node do
  before :each do
    @node1 = Node.new(12, 'title1')
    @node2 = Node.new(13, 'title2')
    @node3 = Node.new(11, 'title3')

    @node1.left = @node3
    @node1.right = @node2
  end

  it "exists" do
    expect(@node1).to be_a Node
  end

  it "has attributes" do
    expect(@node1.left).to eq(@node3)
    expect(@node1.right).to eq(@node2)
    expect(@node1.title).to eq('title1')
  end
end
