class Sittin
 def initialize(name, y)
  @name = name
  @x = 30
  @y = y
  @font = Font.new(15)
 end

 def move
  @y -= 0.8
 end

 def draw
   Window.drawFont(@x, @y, @name, @font)
 end
end