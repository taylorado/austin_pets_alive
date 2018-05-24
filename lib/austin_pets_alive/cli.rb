#Our CLI Controller

class AustinPetsAlive::CLI

  def call
    puts <<-DOC
    Austin Pets Alive!
    Let's Find You A Dog!
DOC
  end

  def list_pets
  end

  def menu
    #more information on one of these dogs?  or move on to next set of most recent dogs?
  end


  end
end