require 'json'
require_relative 'game_author/game'
require_relative 'game_author/author'
require_relative 'input_class'

class App
  def initialize
    @games = []
    @authors = []
    @input_data = InputClass.new
  end

  def add_game
    multiplayer = @input_data.input_multiplayer
    return if multiplayer != true || multiplayer != false

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

  # writhe file methode
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
