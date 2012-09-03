class Background
  def initialize(filename)
    @img = Image.load(filename)
  end
  
  def draw
    Window.draw(0,0,@img)
  end
end

class Image
  def initialize(x,y,filename)
    @img = Image.load(filename)
    @x = x
    @y = y
  end
  
  def draw
    Window.draw(@x,@y,@img)
  end
end