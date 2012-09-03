require_relative "gazou"
class Fish < Gazou

def initialize(img,y)
  @img = Image.load(img)
  @x = 440 
  @y = y
  end
 def move
   @y -= 0.8
 end
 
end