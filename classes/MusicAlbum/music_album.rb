require_relative '../item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
  end

  # Convert the object attributes to a hash
  def to_hash
    {
      id: @id,
      publish_date: @publish_date,
      archived: @archived,
      on_spotify: @on_spotify
    }
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
