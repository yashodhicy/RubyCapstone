require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :genre, :label, :author, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end

#   these methods will give linter errors but when
#   we implement other classes and relationship
#   it will be okay.

# rubocop:disable all
  def genre=(genre)
    @genre = genre
  end

# rubocop:enable all
  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end
# rubocop:disable all
  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
  end
  
# rubocop:enable all

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Date.today.year
    publish_year = @publish_date.year
    return true if current_year - publish_year > 10

    false
  end
end
