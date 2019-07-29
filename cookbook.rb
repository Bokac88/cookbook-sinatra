require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipes
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_idnex)
    @recipes.delete_at(recipe_idnex)
    save_csv
  end

  # def find(index)
  #   @recipes[index]
  # end

  def mark_completed(index)
    @recipes[index].mark_as_complete!
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(name: row[0], description: row[1], prep_time: row[2], dificulty: row[3], completed: row[4] == "true")
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.dificulty, recipe.completed?.to_s]
      end
    end
  end
end
