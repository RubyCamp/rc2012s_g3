require_relative 'splite'
require_relative 'enemy'

class Ebi < Enemy
  attr_accessor :judge,:life, :x, :y, :max_life, :count, :moved
  def initialize(img,y)
    @moved = false
    @sound = Sound.new("resource/se/shu.wav")
    @flag = 0
    @img = img
	@max_life = 1
	@life = @max_life
	@speedx = rand(5)
  @speedy = @speedx
	@x = Window.width
	@y = y
	@point = 45
	@count = 0
	@judge = CollisionBox.new(self,0,0,@img.width,@img.height)
  end
  
  def move  
    @x -= @speedx
	  @y += @speedy
    @speedy = -@speedy if @y <= 50|| (@y + @img.height) >= Window.height
    
	
    judge.set(@x,@y)
  end
  
  
end
