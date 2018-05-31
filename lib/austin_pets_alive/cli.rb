# Our CLI Controller

class AustinPetsAlive::CLI

  @@start_point = 0.to_int

  def call
    puts <<-DOC
      Austin Pets Alive!
      Let's Find You A Dog!
    DOC
    AustinPetsAlive::Dogs.scrape_dogs
    puts "#{AustinPetsAlive::Dogs.all.count} total dogs found!"
    list_dogs
    menu
    goodbye
  end

  def list_dogs
    puts "10 dogs displayed per page.  Showing dogs #{@@start_point} to #{@@start_point + 10}"
    @dog_page = AustinPetsAlive::Dogs.all[@@start_point, 10]
    @dog_page.each.with_index(1) do |dog, i|
      puts "#{i}. '#{dog.name}' - #{dog.breed} - #{dog.age} old"
    end
    puts "Enter the number of the dog you would like more information on.  Type 'next' to see the next 10 dogs.  Type 'exit' to exit"


  end

  def menu
    # more information on one of these dogs?  or move on to next set of most recent dogs?
    input = nil
    while input != 'exit'
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= 10
        AustinPetsAlive::Dogs.show_dog(input.to_i - 1 + @@start_point)
      elsif input == 'next' || input == 'n'
        @@start_point += 10
        if @@start_point < AustinPetsAlive::Dogs.all.count
          list_dogs
        else
          puts "There are no more dogs!  Type 'exit' to exit."

        end

      elsif input != 'exit'
        puts 'Invalid input. Try Again.'

      end
    end

  end

  def goodbye
    puts 'Goodbye!'
  end
end
