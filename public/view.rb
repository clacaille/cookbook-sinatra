class CookbookView
  def display(recipes, marmiton = false)
    if marmiton
      puts "Looking on Marmiton..."
    else
      puts "Cookbook recipes:"
    end
    recipes.each_with_index do |recipe, index|
      mark = recipe.tested ? "[X]" : "[ ]"
      puts "#{mark unless marmiton} #{index + 1} - #{recipe.name} - #{recipe.cooking_time}min - #{recipe.difficulty}"
    end
  end

  def ask_user_for_index(action)
    puts "Which one do you want to #{action} ?"
    print "> "
    return gets.chomp.to_i - 1
  end

  def ask_user_for(element)
    puts "#{element} for the new recipe ?"
    print "> "
    return gets.chomp
  end

  def search
    puts "What do you want to search ?"
    print "> "
    return gets.chomp
  end
end
