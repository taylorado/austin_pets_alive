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
    puts "10 dogs displayed per page."
    @dog_page = AustinPetsAlive::Dogs.all[@@start_point, 10]
    @dog_page.each.with_index(1) do |dog, i|
      puts "#{i}. '#{dog.name}' - #{dog.breed} - #{dog.age} old"
    end


  end

  def menu
    # more information on one of these dogs?  or move on to next set of most recent dogs?
    input = nil
    while input != 'exit'
      puts "Enter the number of the dog you would like more information on.  Type 'next' to see the next 10 dogs.  Type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= @dog_page.count
        AustinPetsAlive::Dogs.show_dog(input.to_i - 1 + @@start_point)
      elsif input == 'next'
        @@start_point += 10
        list_dogs

      elsif input != 'exit'
        puts 'Invalid input. Try Again.'

      end
    end
  end

  def goodbye
    puts 'Goodbye!'
  end
end
