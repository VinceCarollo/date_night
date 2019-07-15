require './lib/binary_search_tree'

RSpec.describe BinarySearchTree do
  before :each do
    @tree = BinarySearchTree.new
    @bill_and_ted = @tree.insert(61, "Bill & Ted's Excellent Adventure")
    @johny_english = @tree.insert(16, "Johnny English")
    @sharknado = @tree.insert(92, "Sharknado 3")
    @hannibal = @tree.insert(50, "Hannibal Buress: Animal Furnace")
  end

  it "exists" do
    expect(@tree).to be_a BinarySearchTree
  end

  it "can insert" do
    expect(@bill_and_ted).to eq(0)
    expect(@johny_english).to eq(1)
    expect(@sharknado).to eq(1)
    expect(@hannibal).to eq(2)
  end

  it "can verify or reject presence of score" do
    expect(@tree.include?(16)).to be true
    expect(@tree.include?(72)).to be false
    expect(@tree.include?(50)).to be true
  end
end
