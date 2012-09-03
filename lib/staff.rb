class Staff
 def initialize(name, y)
  @name = name
  @x = 50
  @y = y
  @font = Font.new(15)
 end

 def move
  @y -= 1
 end

 def draw
   Window.drawFont(@x, @y, @name, @font)
 end
end