require_relative '../item'
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_hash
    { 
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state,
      publish_date: @publish_date
    }
  end

  private

  def can_be_archived?()
    return true if super || cover_state == 'bad'

    false
  end
end
