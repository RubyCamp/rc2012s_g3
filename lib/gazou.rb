class Gazou

 def initialize(img)
  @img = Image.load(img)
  @x = 180
  @y = 80
 end

 def draw
  Window.draw(@x, @y, @img)
 end

 
end