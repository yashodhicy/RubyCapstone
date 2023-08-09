require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?()
    current_year = Date.today.year
    last_played_at_year = @last_played_at.year
    return true if current_year - last_played_at_year > 10

    false
  end
end
