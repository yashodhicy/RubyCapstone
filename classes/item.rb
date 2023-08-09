require 'date'

class Item
  attr_accessor :publish_date, :archived
  attr_reader :id, :genre, :label, :author, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1...1000)
    @publish_date = publish_date
    @archived = archived
  end


  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
  
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
