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
  def genre=(genre)
    @genre = genre
  end

  def label=(label)
    @label = label
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?()
    return true if @publish_date > 10
    return false
  end
end