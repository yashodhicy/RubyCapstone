require_relative '../classes/book/label'
require_relative '../classes/book/book'
require_relative '../classes/item'

describe 'Label' do
  context 'Testing label class' do
    book = Book.new('John', 'good', Date.parse('2023-08-08'))
    label = Label.new('Book-label', 'Red')

    it 'has the label title' do
      expect(label.title).to eq 'Book-label'
    end

    it 'has the label title' do
      expect(label.color).to eq 'Red'
    end

    it 'add book item object to label items array' do
      label.add_item(book)
      expect(label.items[0]).to eq book
    end
  end
end
