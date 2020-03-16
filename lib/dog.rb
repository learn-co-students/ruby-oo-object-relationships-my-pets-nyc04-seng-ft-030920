require 'pry'
require_relative 'owner.rb'

class Dog 
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []

  def initialize(name, owner)
    @name = name 
    @owner = owner
    @mood = "nervous"
    @@all << self
  end 

  def self.all 
    @@all
  end 

  def inspect
    "<Dog: #{name}, #{mood}, #{owner}>"
  end 

end