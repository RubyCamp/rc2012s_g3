require_relative 'splite'
require_relative 'enemy'
require_relative 'item'

class Shijimi < Enemy
  attr_accessor :judge,:life, :x, :y, :max_life
  
  def initialize(img,y)
    @flag = 0
    @img = img
	  @max_life = 0
	  @life = @max_life
	  @speed = rand(5)
	  @x = Window.width
	  @y = y
    @point = 10
	  @sound = Sound.new("resource/se/shu.wav")
	  @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
    @item_sound = Sound.new("resource/se/itemget.wav")  # add by daimon
    @item_x = 0 # add by daimon
    @item_y = 0 # add by daimon
    #----- judge at have item ------
    case rand(100)
    when 1..20
      @item = Ruby.new(0,0)
    when 85..99
      @item = Perl.new(0,0)
    else
      @item = nil
    end
   # ----- judge at have item ------
  end
  
  def move
    @x -= @speed
    judge.set(@x,@y)
  end
       
end
    