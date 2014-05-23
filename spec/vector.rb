shared_examples_for 'Vector' do
  subject(:vector) { described_class[] }

  describe '.[]' do
    it 'constructs a vector with elements' do
      expect(described_class[4,5,6].to_a).to eql [4,5,6]
    end
  end

  describe '#append' do
    it 'should add to the end' do
      expect(
        [1,2,3].reduce(vector) {|memo, item| memo.append(item) }
      ).to eql described_class[1, 2, 3]
    end

    it 'should be persistent' do
      vector = vector().append(7).append(9)
      vector.append(8)
      expect(vector).to eql described_class[7, 9]
    end
  end

  describe '#prepend' do
    it 'should add to the beginning' do
      expect(
        [1,2,3].reduce(vector) {|memo, item| memo.prepend(item) }
      ).to eql described_class[3,2,1]
    end

    it 'should be persistent' do
      vector = vector().prepend(7).prepend(9)
      vector.append(8)
      expect(vector).to eql described_class[9, 7]
    end
  end

  describe '#add' do
    it 'should append' do
      expect(vector.add(1).add(:b)).to eql described_class[1, :b]
    end
  end

end
