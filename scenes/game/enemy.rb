require_relative 'splite'

class Enemy < Splite
  attr_accessor :moved,:item,:img,:item_x,:item_y # edit by daimon
  
  def initialize(filename)
    @img = Image.load(filename)
    @x = 640 - @img.width
    @y = rand(480 - @img.height)
    @max_life = 1
    @life = @max_life
    @attack = 1
    @speed = -4
    @point = 10
    @moved = false
	  @sound = Sound.new("resource/se/shu.wav")
    @item_sound = Sound.new("resource/se/itemget.wav") # add by daimon
    @item_x = 0 # add by daimon
    @item_y = 0 # add by daimon
    # --- judge at have item -----
    case rand(100)
    when 1..10
      @item = Ruby.new(@x,@y)
    when 11..15
      @item = Perl.new(@x,@y)
    else
      @item = nil
    end
    # --- judge at have item -----    
  end
  
  def move
    if @y < 50
      @y = 50
    end
  end
  
  def boss_move
  end
  
  def moved?
    return @moved
  end
  
  def attack_pattern
  end
  
  def attack
  end
  
  
  def damage(map)
    @life -= 1 if @x <= 640 - @img.width
	@sound.play
    if @life < 0
      @item_x = @x  # add by daimon
      @item_y = @y  # add by daimon
      kill(map)
	    return true
    end
	return false
  end

  def kill(map)
    @y = 10000
	map.point += @point
  end
  
  def get_height
    return @img.height
  end
end