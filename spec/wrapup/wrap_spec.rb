require 'wrapup/wrap'
module WrapUp
  describe Wrap do
    describe "#initialize" do
      it "takes a collection and a constant in which to wrap the collection" do
        described_class.new [], double
      end
    end

    describe "enumerability" do
      it " has the standard enumerability module in its ancestors" do
        described_class.ancestors.should include Enumerable
      end
    end

    describe "#each" do
      [:item_1,:item_2,:wrap_1,:wrap_2,:constant].each { |name| let(name) { double name } }
      let(:collection) { [item_1,item_2] }
      let(:output)     { [] }

      before do
        constant.stub(:new).and_return do |item|
          case item
          when item_1 then wrap_1
          when item_2 then wrap_2
          end
        end
      end

      let(:wrap) { described_class.new collection, constant }
      subject { wrap.each { |i| output << i } }

      it "iterates over the collection" do
        collection.should_receive(:each)
        subject
      end
      it "wraps the items in constant" do
        constant.should_receive(:new).with(item_1).and_return(wrap_1)
        constant.should_receive(:new).with(item_2).and_return(wrap_2)
        subject
      end
      it "yields wrapped items to block" do
        subject
        output.should == [wrap_1,wrap_2]
      end
    end
  end
end
