require 'rspec'
require_relative '../classes/MusicAlbum/genre'

describe Genre do
  let(:genre) { Genre.new('Action') }
  let(:item) { double('Item', genre: nil) }

  describe '#initialize' do
    it 'assigns a name to the genre' do
      expect(genre.name).to eq('Action')
    end

    it 'initializes an empty items array' do
      expect(genre.items).to eq([])
    end

    it 'assigns an id between 1 and 1000' do
      expect(genre.id).to be_between(1, 1000)
    end
  end

  describe '#add_item' do
    before do
      # Mock the `genre=` method on item to accept the assignment without errors
      allow(item).to receive(:genre=)
    end

    it 'adds the item to the items array' do
      genre.add_item(item)
      expect(genre.items).to include(item)
    end

    it 'does not add the item if it is already in the items array' do
      genre.add_item(item)
      genre.add_item(item)
      expect(genre.items.count(item)).to eq(1)
    end

    it 'sets the genre for the item' do
      expect(item).to receive(:genre=).with(genre)
      genre.add_item(item)
    end
  end
end
