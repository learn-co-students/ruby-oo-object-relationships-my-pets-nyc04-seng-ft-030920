require 'pry'
class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader  :species
  @@all = []
  def initialize(name)
    @name = name 
    @species = "human"
    @@all << self
    @pets = { :dogs => [], :cats => [] }
  end 
 
  def say_species 
   "I am a #{@species}."
  end
  
  def self.all 
    @@all 
  end 
  
  def self.count
   Owner.all.count
  end 

  def self.reset_all 
    Owner.all.clear
  end
  
  def cats 
   Cat.all.select { |cats|cats.owner == self }
  end 
  def dogs 
    Dog.all.select { |dogs| dogs.owner == self}
  end
 def buy_cat(cat_name)
  @pets[:cats] << Cat.new(cat_name,self)
   end

  def buy_dog(dog_name)
    @pets[:dogs] << Dog.new(dog_name,self)
     end
def walk_dogs
      @pets.collect do |species, instances|
        if species == :dogs
          instances.each do |dog|
            dog.mood = "happy"
          end
        end
      end
    end
    def list_pets
      num_dogs = @pets[:dogs].size
      num_cats = @pets[:cats].size
      return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
    end
end