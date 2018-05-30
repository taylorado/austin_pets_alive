# Our CLI Controller

class AustinPetsAlive::CLI
  def call
    puts <<-DOC
      Austin Pets Alive!
      Let's Find You A Dog!
    DOC

    list_dogs
    menu
    goodbye
  end

  def list_dogs
    @dogs = AustinPetsAlive::Dogs.today
    puts "#{@dogs.count} total dogs found!"
    @dogs.each.with_index(1) do |dog, i|
      puts "#{i}. '#{dog.name}' - #{dog.breed} - #{dog.age} old"
    end
  end

  def menu
    # more information on one of these dogs?  or move on to next set of most recent dogs?
    input = nil
    while input != 'exit'
      puts "Enter the number of the dog you would like more information on.  Type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i > 0
        current_dog = @dogs[input.to_i - 1]
        puts "#{current_dog.name} is a #{current_dog.age} old #{current_dog.sex} #{current_dog.breed}"
        puts "More Information: https://www.austinpetsalive.com#{current_dog.url}"
      elsif input != 'exit'
        puts 'Invalid input. Please enter a number to see more information on a dog, or type list or exit.'

      end
    end
  end

  def goodbye
    puts 'Goodbye!'
  end
end
