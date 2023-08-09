class InputClass
  def input_multiplayer
    print 'Multiplayer(y or n) : '
    multipayer = gets.chomp
    if multipayer.downcase == 'y'
      true
    elsif multipayer.downcase == 'n'
      false
    else
      puts 'you added the incorrect word'
    end
  end

  def input_last_played_at
    print 'last_played_at (YYYY-MM-DD) : '
    gets.chomp
  end

  def input_publish_date
    print 'publish_date (YYYY-MM-DD) : '
    gets.chomp
  end

  def input_first_name
    puts 'Add author firstName and lastName'
    print 'FistName : '
    gets.chomp
  end

  def input_last_name
    print 'LastName : '
    gets.chomp
  end
end
