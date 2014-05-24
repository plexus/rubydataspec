shared_examples_for 'a persistent collection' do
  subject(:collection) { described_class[] }

  describe '.[]' do
    it 'should create a new collection' do
      expect(collection).to be_a described_class
    end
  end

  describe '#add' do
    it 'should add an item' do
    end
  end

  describe '#inspect' do
    it 'should look like ClassName[..]' do
      expect(collection.inspect).to eql "#{described_class}[]"
    end

    it 'should contain the elements' do
      expect(collection.add(1).inspect).to eql "#{described_class}[1]"
    end
  end

end
