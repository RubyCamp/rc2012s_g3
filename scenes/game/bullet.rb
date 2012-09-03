require_relative 'splite'

class Bullet < Splite
  attr_accessor :judge,:life,:x,:speed,:charge # edit by daimon
  
  def initialize(filename,x, y,level)
    @flag = false
    # --------- edit by daimon ------------
    case level
    when 0
      @speed = 0.3
      @charge = 0.5
    when 1
      @speed = 0.5
      @charge = 1     
    when 2
      @speed = 1
      @charge = 1.5      
    when 3
      @speed = 2
      @charge = 2.5
    when 4 # suzuki
      @speed = -2.5
      
          
    else
      @speed = 2
      @charge = 2.5      
    end
    # --------- edit by daimon ------------
    @x = x + 32
    @y = y
    @img = Image.load(filename)
    @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
  end

  def move
	@x += @speed
	if @x > 640 || @x < 0 - @img.width
	  @y = 10000
    end		
	judge.set(@x,@y)
  end
  
    
  
  def kill
    @y = 100000
  end
end