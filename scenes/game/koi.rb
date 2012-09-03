require_relative 'splite'
require_relative 'enemy'

class Koi < Enemy
  attr_accessor :judge,:life, :x, :y, :max_life, :count, :moved
  def initialize(img,y)
    @moved = false
    @sound = Sound.new("resource/se/shu.wav")
    #@flag = 0
    @img = img
    @max_life = 2
    @life = @max_life
    @speed = 4
    @x = Window.width
    @y = y
    @up_line = 280 + rand(100)
    @point = 30
    @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
  end
  
  def move
    unless @up_line >= @x
      @x -= @speed
    else
      @x -= @speed
      @y -= 6
    end
	  judge.set(@x,@y)
  end
  

end