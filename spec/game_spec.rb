require_relative '../classes/game_author/game'

describe Game do
  context 'we create the Student object and test it ' do
    let(:game) { Game.new(true, '2018-12-31', '2010-12-31') }
    it 'Student name must be Ali' do
      expect(game.multiplayer).to eq(true)
    end
    it 'Student age must be 23' do
      expect(game.last_played_at).to eq('2018-12-31')
    end
  end
end
