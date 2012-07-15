module WrapUp
  class Wrap
    include Enumerable

    def initialize(collection,wrapper_constant)
      @collection = collection
      @wrapper    = wrapper_constant
    end

    def each(&block)
      @collection.each do |item|
        block.call @wrapper.new item
      end
    end
  end
end
