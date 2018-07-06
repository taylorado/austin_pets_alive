class AustinPetsAlive::Dogs
  attr_accessor :name, :breed, :sex, :age, :url

  @@all = []

  def initialize(name, breed, sex, age, url)
    @name = name
    @breed = breed
    @sex = sex
    @age = age
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
