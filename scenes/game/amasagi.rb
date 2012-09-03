require_relative 'splite'
require_relative 'enemy'

class Amasagi < Enemy
  attr_accessor :judge,:life, :x, :y, :max_life, :count, :moved
  def initialize(img,y)
    @moved = false
    @sound = Sound.new("resource/se/shu.wav")
    @flag = 0
    @img = img
	  @max_life = 1
	  @life = @max_life
    @speedy = 6
    @phase = 0
	  @phase_speed = 6
	  @x = Window.width
	  @y = y + rand(32)
	  @point = 40
	  @count = 0
    @amp = 15
	  @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
  end
  
  def move
    @phase += @phase_speed
    if @y < 50
      @y += @phase_speed
    elsif @y > (Window.height - @img.height)
      @y -= @phase_speed
    else
      @y += Math.sin(@phase * Math::PI / 180) * @amp
   end
    @x -= @speedy
	
    judge.set(@x,@y)
  end
  
  
end
