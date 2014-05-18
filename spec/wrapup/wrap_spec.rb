require 'wrapup/wrap'
module WrapUp
  describe Wrap do
    class WrapperClass < Struct.new(:original)
    end

    let(:item_1) { double "item" }
    let(:item_2) { double "item" }
    let(:wrap)   { described_class.new [item_1, item_2], WrapperClass }

    describe "#initialize" do
      it "takes a collection and a constant in which to wrap the collection" do
        described_class.new [], WrapperClass
      end
    end

    describe "enumerability" do
      it " has the standard enumerability module in its ancestors" do
        expect(described_class.ancestors).to include Enumerable
      end
    end

    describe '#[]' do
      it 'allows access to an individual via a wrapper' do
        expect( wrap[1] ).to be_a WrapperClass
        expect( wrap[1].original ).to eq item_2
      end
    end

    describe '#size' do
      it 'measure the internal collection size' do
        expect( wrap.size ).to eq 2
      end
    end

    describe "#each" do
      let(:output) { [] }

      before { wrap.each { |i| output << i } }

      it "wraps the items in constant" do
        expect( output.all? { |item| item.is_a? WrapperClass } ).to eq true
      end
      it 'wraps them in order' do
        expect( output.map(&:original) ).to eq [item_1,item_2]
      end
    end
  end
end
