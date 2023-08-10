require 'json'
require_relative 'MusicAlbum/music_album'
require_relative 'MusicAlbum/genre'
require_relative 'input_class'
require_relative 'game_author/game'
require_relative 'game_author/author'

last_played_at = @input_data.input_last_played_at
publish_date = @input_data.input_publish_date

add_author

@games.push({ multiplayer:, last_played_at:, publish_date: })


write_file('json/games.json', @games)
puts 'game created successfully'

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

def load_data(file_name)
  if File.exist?(file_name)
    file_content = File.read(file_name)
    JSON.parse(file_content, symbolize_names: true)
  else
    []
  end
end

app = App.new
app.main_menu
