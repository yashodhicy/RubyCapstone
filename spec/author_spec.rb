require_relative '../classes/game_author/author'
require_relative '../classes/item'

describe Author do
  context 'I create the author object and test it' do
    let(:author) { Author.new('Alishah', 'Safdari') }
    let(:item) { Item.new('2022-12-31') }
    it 'Author first_name must be Alishah' do
      expect(author.first_name).to eq('Alishah')
    end
    it 'Author last name must be Safdari' do
      expect(author.last_name).to eq('Safdari')
    end
    it 'sets the item author to the current author' do
      author.add_item(item)
      expect(item.author).to eq(author)
    end
    it 'does not add the same item twice' do
      author.add_item(item)
      expect do
        author.add_item(item)
      end.not_to(change { author.items.length })
    end
    it 'adds an item to the author' do
      expect do
        author.add_item(item)
      end.to change { author.items.length }.by(1)
    end
    it 'adds an item to the author' do
      author.add_item(item)
      expect(author.items).to include(item)
    end
    it 'check date' do
      expect(item.publish_date).to eq('2022-12-31')
    end
  end
end
