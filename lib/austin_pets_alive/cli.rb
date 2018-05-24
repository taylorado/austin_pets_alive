#Our CLI Controller

class AustinPetsAlive::CLI

  def call
   list_dogs
   menu
   goodbye
  end

  def list_dogs
  puts <<-DOC
      Austin Pets Alive!
      Let's Find You A Dog!
    DOC
    @dogs = AustinPetsAlive::Dogs.today
    @dogs.each.with_index(1)  do |dog, i|
      puts "#{i}. #{dog.name} - #{dog.breed}"
      puts "#{dog.age}"
      puts "https://www.austinpetsalive.org#{dog.url}"
      end
  end

  def menu
    #more information on one of these dogs?  or move on to next set of most recent dogs?
    input = nil
    while input != 'exit'
      puts "Enter the number of the dog you would like more information on.  Or type 'next' to list the next 5 dogs available for adoption.  Type 'exit' to exit"
      input = gets.strip.downcase

      if input.to_i > 0
       current_dog = @dogs[input.to_i-1]
       puts "#{current_dog.name} - #{current_dog.age} - #{current_dog.breed}"
       puts "More Information: #{current_dog.url}"
      elsif input == "list"
        list_dogs
      else
        puts "Invalid input.  Please enter a number to see more information on a dog, or type list or exit."

      end
    end
  end


def goodbye
  puts 'Goodbye!'
end

end