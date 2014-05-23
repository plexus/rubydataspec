module RubyData
  class List < Array
    def prepend(item)
      self.class[item, *self]
    end

    alias add prepend

    def eql?(other)
      self.class.equal? other.class && super
    end

    def inspect
      "#{self.class}#{super}"
    end
  end
end
