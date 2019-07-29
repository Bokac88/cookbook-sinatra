class Recipe
  attr_reader :name, :description, :prep_time, :dificulty
  def initialize(recipes_attr = {})
    @name = recipes_attr[:name]
    @description = recipes_attr[:description]
    @prep_time = recipes_attr[:prep_time]
    @dificulty = recipes_attr[:dificulty]
    @completed = recipes_attr[:completed] | false
  end

  def completed?
    @completed
  end

  def mark_as_complete!
    @completed = true
  end
end
