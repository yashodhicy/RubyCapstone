class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def to_hash
    {
      id: @id,
      first_name: @first_name,
      last_name: @last_name
    }
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end
end
