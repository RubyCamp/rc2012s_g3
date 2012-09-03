require_relative 'splite'
require_relative 'enemy'

class Unagi < Enemy
  attr_accessor :judge,:life, :x, :y, :max_life, :count, :moved
  def initialize(img,y)
    @moved = false
    @sound = Sound.new("resource/se/shu.wav")
    @flag = 0
    @img = img
    @max_life = 2
    @life = @max_life
    @speed = rand(5)
    @x = Window.width
    @y = y
    @point = 30
    @count = 0
    @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
  end
  
  def move
    if @x > (Window.width / 2 + 50)  
      @x -= @speed
	  
	else
      @y += @speed
      @speed = -@speed if @y <= 50|| (@y + @img.height) >= Window.height
    end
    judge.set(@x,@y)
  end
  
  def boss_move
     @x -= @speed
  end
  
  def attack
    bullet = Bullet.new("resource/img/effect/denki.png", @x, @y+(@img.height / 2 ) - 8,4)# - @img.width
	return bullet
  end
end
