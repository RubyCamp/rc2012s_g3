class Splite
  def initialize(filename,x = -100,y = -100)
    @x = x
    @y = y
    @img = Image.load(filename)
  end
  
  def draw
    Window.draw(@x,@y,@img)
  end
  
  def load(filename)
    @img = Image.load(filename)
  end
end	

