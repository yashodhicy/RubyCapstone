require_relative '../item'

class MusicAlbum < Item
  attr_accessor :id, :publish_date, :on_spotify, :archived, :genre

  def initialize(published_date = nil, on_spotify: false, archived: false)
    super(published_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return false unless publish_date && publish_date < (Date.today.prev_year(10))

    @on_spotify
  end
end
