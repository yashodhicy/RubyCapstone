class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :genre , :label, :author, :source

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
end
