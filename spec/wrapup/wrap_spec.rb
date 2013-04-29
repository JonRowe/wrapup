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
        described_class.ancestors.should include Enumerable
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
