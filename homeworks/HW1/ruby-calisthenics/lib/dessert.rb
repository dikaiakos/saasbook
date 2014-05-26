
#testing classes in Ruby

class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    return @calories < 200
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert

  attr_accessor :flavor

  def initialize(flavor)
    @flavor = flavor
    @calories = 5
    @name = flavor.to_s + " jelly bean"
  end

  def delicious?
    if @flavor.eql? "licorice"
      return false
    else
      return true
    end
  end
      

end


jel = JellyBean.new("Choco")
jel.calories= 400
puts jel.delicious?


