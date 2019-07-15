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

  it "can find depth of value" do
    expect(@tree.depth_of(92)).to eq(1)
    expect(@tree.depth_of(50)).to eq(2)
    expect(@tree.depth_of(0)).to be nil
  end

  it "can get max value in tree" do
    expected = { "Sharknado 3" => 92 }

    expect(@tree.max).to eq(expected)
  end

  it "can get min value in tree" do
    expected = { "Johnny English" => 16 }

    expect(@tree.min).to eq(expected)
  end

  it "can load txt files" do
    expect(@tree.load('movies.txt')).to eq(99)

    max_expected = { "The Little Engine That Could" => 100 }
    min_expected = { "Cruel Intentions" => 0 }

    expect(@tree.max).to eq(max_expected)
    expect(@tree.min).to eq(min_expected)
  end

  xit "can sort whole tree" do
    expect = [
               {"Johnny English"=>16},
               {"Hannibal Buress: Animal Furnace"=>50},
               {"Bill & Ted's Excellent Adventure"=>61},
               {"Sharknado 3"=>92}
             ]

    expect(@tree.sort).to eq(expected)
  end


end
