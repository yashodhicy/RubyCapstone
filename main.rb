require_relative 'item'

def create_item
  print 'Enter publish year: '
  year = gets.chomp.to_i
  print 'Enter publish month: '
  month = gets.chomp.to_i
  print 'Enter publish day: '
  day = gets.chomp.to_i
  publish_date = Time.new(year, month, day)

  Item.new(publish_date)
end

def move_item_to_archive(items)
  puts 'Select an item to move to the archive:'
  list_items(items)
  print 'Enter item number: '
  item_number = gets.chomp.to_i - 1

  if valid_item_number?(item_number, items)
    item = items[item_number]
    move_to_archive(item)
    puts "Item #{item.id} moved to the archive."
  else
    puts 'Invalid item number.'
  end
end

def list_items(items)
  items.each_with_index { |it, index| puts "#{index + 1}. Item #{it.id}" }
end

def valid_item_number?(item_number, items)
  item_number >= 0 && item_number < items.length
end

def display_item_details(item)
  puts "Item #{item.id} (Archived: #{item.archived})"
end

def display_menu
  puts 'Options:'
  puts '1. Create Item'
  puts '2. Move Item to Archive'
  puts '3. List Items'
  puts '4. Quit'
end

def exit_program
  puts 'Goodbye!'
  exit
end

def invalid_choice
  puts 'Invalid choice. Please select a valid option.'
end

def process_choice(choice, items)
  case choice
  when 1
    create_and_add_item(items)
  when 2
    move_item_to_archive(items)
  when 3
    list_items(items)
  when 4
    exit_program
  else
    invalid_choice
  end
end

def create_and_add_item(items)
  item = create_item
  items << item
  puts "Item with ID #{item.id} created."
end

def main
  items = []

  loop do
    display_menu
    choice = gets.chomp.to_i
    process_choice(choice, items)
    puts "\n"
  end
end

main
