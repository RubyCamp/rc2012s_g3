require_relative 'splite'
require_relative 'bullet'

class Player < Splite
  attr_accessor :judge,:life,:level,:muteki_counter,:x,:y,:img,:bgm
  
  def initialize(filename,map)
    @x = 0
    @y = 240
    @life = 4
    @attack = 1
    @speed = 5
    @level = 2
    @img = Image.load(filename)
    @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
	  @muteki_counter = 60 * 3
    @damage_sound = Sound.new("resource/se/itai.wav") # add by daimon
    @hoimi_sound = Sound.new("resource/se/hoimi.wav") 
    @map = map
  end
  
  def attack
    bullet = Bullet.new("resource/img/effect/ami.png",@x, @y,@level)#EDIT 
    return bullet
  end
  
  def double_attack
    bullets = []
    bullet1 = Bullet.new("resource/img/effect/ami.png",@x,@y + 30,@level)
    bullet2 = Bullet.new("resource/img/effect/ami.png",@x, @y-30,@level)
    bullets << bullet1
    bullets << bullet2
    return bullets
  end
  
  def move
    @x += Input.x * @speed
    @y += Input.y * @speed
    judge.set(@x,@y)
    @x = 0 if @x < 0
    @x = 640 - @img.width if @x > 640 - @img.width
    @y = 50 if @y < 50
    @y = 480- @img.height if @y > 480 - @img.height
  end	
    
  def damage
    if @muteki_counter > 60 * 3
	    @life -= 1
	    @muteki_counter = 0
      @damage_sound.play # add by daimon
	  end
	  gameover if @life < 0
  end
  
  def muteki
    @muteki_counter += 1
  end 

  def hoimi
    @life += 1
    @hoimi_sound.play
  end

  
  def gameover
    @life = 4
    @x = 0
    @y = 240
    @level = 1
    @map.sound_flag = 2
    Scene.set_scene(:gameover) # edit by daimon
  end	
end
