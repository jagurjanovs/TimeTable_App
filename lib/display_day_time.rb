module DisplayDayTime

  def display_day_and_time(day, time)
    case weekday
      when day == 0
        puts "Monday"
      when day == 1
        puts "Tuesday"
      when day == 2
        puts "Wednesday"
      when day == 3
        puts "Thursday"
      when day == 4
        puts "Friday"
    end

    case start_time
      when time == 0
        puts "9am"
      when time == 1
        puts "10am"
      when time == 2
        puts "11am"
      when time == 3
        puts "12pm"
      when time == 4
        puts "1pm"
      when time == 5
        puts "2pm"
      when time == 6
        puts "3pm"
      when time == 7
        puts "4pm"
      when time == 8
        puts "5pm"
    end
  end
end