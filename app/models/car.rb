class Car

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @speed = 0
  end

  def make
    @make
  end

  def model
    @model
  end

  def year
    @year
  end

  def speed
    @speed
  end

  def accelerate
    @speed += 10
  end

end
