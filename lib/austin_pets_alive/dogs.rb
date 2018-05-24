class AustinPetsAlive::Dogs
attr_accessor :name, :breed, :age, :url
  def self.today
    #return available dogs
    #puts <<-DOC
#1. Rufus
#2. Pablo
#3. Brutus
#4. Carter
#5. Bunker
 #   DOC

    dog_1 = self.new
    dog_1.name = "Rufus"
    dog_1.breed = "Lab"
    dog_1.age = "4 years"  # text representation
    dog_1.url = "http://austinpetsalive.org"


    dog_2 = self.new
    dog_2.name = "Pablo"
    dog_2.breed = "Beagle Mix"
    dog_2.age = "4 months"  # text representation
    dog_2.url = "http://austinpetsalive.org"

    [dog_1, dog_2]

  end
end