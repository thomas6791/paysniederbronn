class TaxeSejour
  attr_reader :name, :width, :length
  def initialize(name, width, length)
    @name = name
    @width, @length = width, length
  end
  def coucou
    return "Bonsoir"
  end

  def floor_area
    @width * @length
  end
end
