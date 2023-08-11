require 'json'
require_relative 'game_author/game'
require_relative 'game_author/author'
require_relative 'input_class'
require_relative 'book/book'
require_relative 'book/label'
require_relative 'MusicAlbum/genre_operation'
require_relative 'MusicAlbum/music_operations'

class App
  attr_accessor :music_album_operations, :genre_operations

  def initialize
    @music_album_operations = MusicAlbumOperations.new
    @genre_operations = GenreOperations.new
    @games = []
    @authors = []
    @books = []
    @labels = []
    @input_data = InputClass.new
  end

  def add_book
    book = Book.new(@input_data.publisher, @input_data.cover_state, @input_data.publish_date)
    label = choose_label
    label&.add_item(book)
    data = read_file('json/books.json')
    @books = data
    @books << book
    write_file('json/books.json', @books)
    puts 'Add a book successfully'
  end

  def add_label
    label = Label.new(@input_data.title, @input_data.color)
    data = read_file('json/labels.json')
    @labels = data
    @labels << label
    write_file('json/labels.json', @labels)
    puts 'Add a label successfully'
    label
  end

  def choose_label
    label = nil
    until label
      puts 'Choose a label from the list by entering the corresponding id:'
      puts '0 - Create a new label'
      lables_list
      label_choice = gets.chomp.to_i
      if label_choice.zero?
        label = add_label
      else
        data = read_file('json/labels.json')
        lablehash = data.find { |l| l[:id].to_i == label_choice }
        if lablehash.nil?
          puts 'Invalid label selection. Please choose a valid option.'
        else
          label = Label.new(lablehash[:title], lablehash[:color])
          label.id = lablehash[:id].to_i
        end
      end
    end
    label
  end

  def book_list
    data = read_file('json/books.json')
    return puts "there are no books.Let's add a book" if data.empty?

    data.each do |book|
      puts "publisher: #{book[:publisher]}, cover_state: #{book[:cover_state]}, published date: #{book[:publish_date]}"
    end
  end

  def lables_list
    data = read_file('json/labels.json')
    return puts 'there are no labels.' if data.empty?

    data.each do |label|
      puts "id: #{label[:id]},title: #{label[:title]}, color: #{label[:color]}"
    end
  end

  def add_game
    multiplayer = @input_data.input_multiplayer
    return if multiplayer != true && multiplayer != false

    last_played_at = @input_data.input_last_played_at
    publish_date = @input_data.input_publish_date
    add_author
    res = read_file('json/games.json')
    if !res.nil? && res.class != Array
      @games.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @games = res
    end
    @games.push(Game.new(multiplayer, last_played_at, publish_date))
    write_file('json/games.json', @games)
    puts 'game created successfully'
  end

  def add_author
    first_name = @input_data.input_first_name
    last_name = @input_data.input_last_name
    res = read_file('json/authors.json')
    if !res.nil? && res.class != Array
      @authors.push(res)
    elsif !res.nil? && res.instance_of?(Array)
      @authors = res
    end
    @authors.push(Author.new(first_name, last_name))
    write_file('json/authors.json', @authors)
  end

  def game_list
    @games = read_file('json/games.json')
    puts 'Please create a game at first.' if @games.empty?
    @games.each do |game|
      print "multipayer: \"#{game[:multiplayer]}\", last_played_at: \""
      print "#{game[:last_played_at]}, publish_date: \"#{game[:publish_date]} "
      puts
    end
    puts ''
  end

  def author_list
    @authors = read_file('json/authors.json')
    @games = read_file('json/games.json')
    puts 'Please create a game at first.' if @games.empty?
    @authors.each do |author|
      puts "FirstName: \"#{author[:first_name]}\"    LastName: \"#{author[:last_name]} "
    end
    puts ''
  end

  # write file method
  def write_file(file, content)
    data = content.map(&:to_hash)
    json = JSON.pretty_generate(data)
    File.write(file, json)
  end

  # read file method
  def read_file(file_name)
    # Handle if file does not exist
    if File.exist?(file_name)
      file = File.read(file_name)
      JSON.parse(file, symbolize_names: true)
    else
      []
    end
  end
end
