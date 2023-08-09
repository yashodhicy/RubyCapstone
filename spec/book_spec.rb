require_relative '../classes/book'
require 'date'

describe Book do
  context 'testing the Book class' do
    book = Book.new('John', 'good', Date.parse('2023-08-08'))

    it 'has a publisher' do
      expect(book.publisher).to eq('John')
    end

    it 'has a cover state' do
      expect(book.cover_state).to eq('good')
    end

    it 'has a publish_date' do
      expect(book.publish_date).to eq(Date.parse('2023-08-08'))
    end
  end
end
