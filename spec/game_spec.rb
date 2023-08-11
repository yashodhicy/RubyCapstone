require_relative '../classes/game_author/game'

describe Game do
  context 'we create the a game object and test it ' do
    let(:game) { Game.new(true, '2018-12-31', '2010-12-31') }
    it 'game multiplayer must be true' do
      expect(game.multiplayer).to eq(true)
    end
    it 'game last played at should be equal to this date.' do
      expect(game.last_played_at).to eq('2018-12-31')
    end
  end
end
