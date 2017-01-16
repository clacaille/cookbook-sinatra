class Recipe
  attr_reader :name, :description, :cooking_time, :difficulty
  attr_accessor :tested

  def initialize(attributes = {tested: false})
    @name = attributes[:name]
    @description = attributes[:description]
    @cooking_time = attributes[:cooking_time]
    @tested = attributes[:tested]
    @difficulty = attributes[:difficulty]
  end
end
