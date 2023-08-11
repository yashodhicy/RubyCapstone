class InputClass
  def input_multiplayer
    print 'Multiplayer(y or n) : '
    multipayer = gets.chomp
    if multipayer.downcase == 'y'
      true
    elsif multipayer.downcase == 'n'
      false
    else
      puts 'you added the incorrect value'
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

  def publisher
    print 'Enter publisher name here...'
    gets.chomp
  end

  def cover_state
    print 'Enter cover_state here...(example: bad or good)'
    gets.chomp
  end

  def publish_date
    print 'Enter publish year: '
    year = gets.chomp.to_i
    print 'Enter publish month: '
    month = gets.chomp.to_i
    print 'Enter publish day: '
    day = gets.chomp.to_i

    Date.new(year, month, day)
  end

  def title
    print 'add lable title'
    gets.chomp
  end

  def color
    print 'add lable color'
    gets.chomp
  end
end
