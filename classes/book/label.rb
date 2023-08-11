class Label
  attr_accessor :title, :color, :id
  attr_reader :items

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def to_hash
    {
      id: @id,
      title: @title,
      color: @color
    }
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end
end
