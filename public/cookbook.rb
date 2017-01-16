require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @recipes = []
    @csv_file = csv_file
    load_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    csv_write
  end

  def remove_recipe(recipe_id)
    @recipes.delete_at(recipe_id)
    csv_write
  end

  def mark_as_tested(index)
    @recipes[index].tested = !@recipes[index].tested
    csv_write
  end

  def all
    return @recipes
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |name, description, cooking_time|
      @recipes << Recipe.new({name: name, description: description, cooking_time: cooking_time})
    end
  end

  def csv_write
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.cooking_time]
      end
    end
  end
end
