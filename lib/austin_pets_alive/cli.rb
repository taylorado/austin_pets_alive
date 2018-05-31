# Our CLI Controller

class AustinPetsAlive::CLI
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
    puts '10 dogs displayed per page.'
    AustinPetsAlive::Dogs.all[0,10].each.with_index(1) do |dog, i|
      puts "#{i}. '#{dog.name}' - #{dog.breed} - #{dog.age} old"
    end
  end

  def menu
    # more information on one of these dogs?  or move on to next set of most recent dogs?
    input = nil
    while input != 'exit'
      puts "Enter the number of the dog you would like more information on.  Type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= AustinPetsAlive::Dogs.all.count
        AustinPetsAlive::Dogs.show_dog(input.to_i - 1)
      elsif input != 'exit'
        puts 'Invalid input. Try Again.'

      end
    end
  end

  def goodbye
    puts 'Goodbye!'
  end
end
