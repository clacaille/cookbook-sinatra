require_relative 'view'
require_relative 'recipe'
require_relative 'marmiton'
require 'open-uri'
require 'nokogiri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @cookbook_view = CookbookView.new
  end

  def list
    list_recipes
  end

  def create
    name = @cookbook_view.ask_user_for("Name")
    description = @cookbook_view.ask_user_for("Description")
    recipe = Recipe.new({name: name, description: description})
    @cookbook.add_recipe(recipe)
  end

  def destroy
    list_recipes
    index = @cookbook_view.ask_user_for_index("remove")
    @cookbook.remove_recipe(index)
  end

  def mark
    list_recipes
    index = @cookbook_view.ask_user_for_index("mark as tested")
    @cookbook.mark_as_tested(index)
  end

  def scrap
    list = []
    keyword = @cookbook_view.search
    marmiton = Marmiton.new
    list = marmiton.search(keyword)
    @cookbook_view.display(list, true)
    index = @cookbook_view.ask_user_for_index("add")
    recipe = list[index]
    @cookbook.add_recipe(recipe)
  end

  private

  def list_recipes
    recipes = @cookbook.all
    @cookbook_view.display(recipes)
  end
end
