require_relative 'bullet'

class Boss_Bullet < Bullet
  attr_accessor :judge,:life
  def initialize(filename,x,y,vx,vy,speedx,speedy,sita,flag)
    @x = x
    @y = y
    @img = Image.load(filename)
    @vx = vx + speedx
    @vy = vy + speedy
    @judge = CollisionBox.new(self,40,0,@img.width,@img.height)
    @sita = sita
  end
  
  
  def move
    @x += @vx
    @y += @vy
	  if @x > 640 || @x < 0 - @img.width
	    @y = 10000
    end		
	  judge.set(@x,@y)
  end
  
  def draw
    Window.drawRot(@x,@y,@img,@sita)
  end
end
    