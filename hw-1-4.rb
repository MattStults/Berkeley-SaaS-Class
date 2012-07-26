class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    @calories < 200
  end
  def delicious?
    true
  end 
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super name, calories
    @flavor = flavor.downcase
  end
  def delicious?
    @flavor != "black licorice"
  end 
end