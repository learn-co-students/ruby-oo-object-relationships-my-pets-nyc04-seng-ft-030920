require 'pry'

class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def feed_cats
    cats.map {|cat| cat.mood = "happy"}
  end

  def walk_dogs
    dogs.map {|dog| dog.mood = "happy"}
  end

  def sell_pets
    cats.each {|cat| cat.mood = "nervous"}
    dogs.each {|dog| dog.mood = "nervous"}
    cats.each {|cat| cat.owner = nil}
    dogs.each {|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end