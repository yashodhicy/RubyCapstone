require_relative 'classes/app'

def choose_option
  'please choose an option by entering a number
  1 - List all books
  2 - List all music albums
  3 - List of games
  4 - List all genres
  5 - List all labels
  6 - List all authors
  7 - Add a book
  8 - Add a music album
  9 - Add a game
  10 - Exit'
end

def choose_list(number, app)
  case number
  when 1 then app.book_list
  when 2 then app.music_album_operations.list
  when 3 then app.game_list
  when 4 then app.genre_operations.list
  when 5 then app.lables_list
  when 6 then app.author_list
  end
end

def choose_num(number, app)
  case number
  when 1..6 then choose_list(number, app)
  when 7 then app.add_book
  when 8 then app.music_album_operations.add_album(app.genre_operations)
  when 9 then app.add_game
  else
    puts 'Thank you for using this app'
  end
end

def main
  app = App.new

  loop do
    puts choose_option
    number = gets.chomp.to_i
    break if number == 10

    choose_num(number, app)
    puts "\n"
  end
end

main
