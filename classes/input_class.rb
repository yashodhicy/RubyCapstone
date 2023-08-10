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

  def input_year
    print 'Enter album publish year: '
    gets.chomp.to_i
  end

  def input_month
    print 'Enter album publish month: '
    gets.chomp.to_i
  end

  def input_day
    print 'Enter album publish day: '
    gets.chomp.to_i
  end

  def input_on_spotify
    print 'Available on Spotify? (y or n): '
    answer = gets.chomp
    if answer.downcase == 'y'
      true
    elsif answer.downcase == 'n'
      false
    else
      puts 'Invalid choice. Please enter y or n.'
      input_on_spotify
    end
  end
end
