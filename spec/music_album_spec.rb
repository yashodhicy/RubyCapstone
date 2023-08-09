require_relative '../classes/MusicAlbum/album'
require_relative '../classes/item'

describe MusicAlbum do
  let(:publish_date) { '2022-01-01' }

  describe '#initialize' do
    context 'when on_spotify is not provided' do
      let(:album) { MusicAlbum.new(publish_date) }

      it 'initializes with on_spotify as false by default' do
        expect(album.on_spotify).to be_falsey
      end
    end

    context 'when on_spotify is provided' do
      let(:album) { MusicAlbum.new(publish_date, on_spotify: true) }

      it 'initializes with the provided on_spotify value' do
        expect(album.on_spotify).to be_truthy
      end
    end
  end

  describe '#can_be_archived?' do
    let(:album) { MusicAlbum.new(publish_date) }

    before do
      # Stubbing the superclass method to always return true.
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)
    end

    context 'when on_spotify is true' do
      it 'returns true' do
        album.on_spotify = true
        expect(album.send(:can_be_archived?)).to be_truthy
      end
    end

    context 'when on_spotify is false' do
      it 'returns false' do
        album.on_spotify = false
        expect(album.send(:can_be_archived?)).to be_falsey
      end
    end
  end
end
