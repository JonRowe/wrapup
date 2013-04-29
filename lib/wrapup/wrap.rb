module WrapUp
  class Wrap
    include Enumerable

    def initialize collection, wrapper_constant
      @collection = collection
      @wrapper    = wrapper_constant
    end

    def each &block
      @collection.each do |item|
        block.call @wrapper.new item
      end
    end

    def size
      @collection.size
    end

    def [] key
      @wrapper.new @collection[key]
    end
  end
end
