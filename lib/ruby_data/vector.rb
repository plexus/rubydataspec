module RubyData
  class Vector < Array
    def prepend(item)
      self.class[item, *self]
    end

    def append(item)
      self.class[*self, item]
    end

    alias add append

    def eql?(other)
      self.class.equal? other.class && super
    end

    def inspect
      "#{self.class}#{super}"
    end
  end
end
