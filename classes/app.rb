require 'json'
require_relative 'MusicAlbum/music_album'
require_relative 'MusicAlbum/genre'
require_relative 'input_class'
require_relative 'game_author/game'
require_relative 'game_author/author'

class App
  def initialize
    @games = load_data('json/games.json')
    @authors = load_data('json/authors.json')
    @albums = load_data('json/albums.json')
    @genres = [Genre.new('Comedy'), Genre.new('Thriller')]
    @input_data = InputClass.new
  end

  def main_menu
    loop do
      puts 'Options:'
      puts '1. Add a Game'
      puts '2. List All Games'
      puts '3. Add an Author'
      puts '4. List All Authors'
      puts '5. Add a Music Album'
      puts '6. List All Music Albums'
      puts '7. List All Genres'
      puts '8. Exit'
      choice = gets.chomp.to_i

      case choice
      when 1
        add_game
      when 2
        game_list
      when 3
        add_author
      when 4
        author_list
      when 5
        add_album
      when 6
        list_albums
      when 7
        list_genres
      when 8
        puts 'Goodbye!'
        break
      else
        puts 'Invalid choice.'
      end
    end
  end

  def add_game
    multiplayer = @input_data.input_multiplayer
    return if multiplayer.nil?

    last_played_at = @input_data.input_last_played_at
    publish_date = @input_data.input_publish_date

    add_author

    @games.push({ multiplayer:, last_played_at:, publish_date: })

    write_file('json/games.json', @games)
    puts 'game created successfully'
  end

  def add_author
    first_name = @input_data.input_first_name
    last_name = @input_data.input_last_name

    existing_authors = load_data('json/authors.json')

    if existing_authors.is_a?(Array)
      @authors = existing_authors
    elsif !existing_authors.nil?
      @authors.push(existing_authors)
    end

    @authors.push({ first_name:, last_name: })

    write_file('json/authors.json', @authors)
    puts 'Author added!'
  end

  def add_album
    year = @input_data.input_year
    month = @input_data.input_month
    day = @input_data.input_day
    on_spotify = @input_data.input_on_spotify

    album = MusicAlbum.new(Time.new(year, month, day), on_spotify:)
    @albums << album.to_hash

    puts 'Album added!'
    write_file('json/albums.json', @albums)
  end

  def list_albums
    @albums.each do |album|
      puts "ID: #{album[:id]}, Date: #{album[:publish_date]}, On Spotify: #{album[:on_spotify]}"
    end
  end

  def list_genres
    @genres.each { |genre| puts "ID: #{genre.id}, Name: #{genre.name}" }
  end

  def game_list
    @games = load_data('json/games.json')
    if @games.empty?
      puts 'Please create a game first.'
      return
    end
    @games.each do |game|
      print "Multiplayer: \"#{game[:multiplayer]}\", Last Played At: \""
      print "#{game[:last_played_at]}\", Publish Date: \"#{game[:publish_date]}\""
      puts
    end
  end

  def author_list
    @authors = load_data('json/authors.json')
    if @authors.empty?
      puts 'Please add an author first.'
      return
    end
    @authors.each do |author|
      print "First Name: \"#{author[:first_name]}\", Last Name: \"#{author[:last_name]}\""
      puts
    end
  end


  private

  def write_file(file_name, content)
    json = JSON.pretty_generate(content)
    File.write(file_name, json)
  end

  def load_data(file_name)
    if File.exist?(file_name)
      file_content = File.read(file_name)
      JSON.parse(file_content, symbolize_names: true)
    else
      []
    end
  end
end

app = App.new
app.main_menu
