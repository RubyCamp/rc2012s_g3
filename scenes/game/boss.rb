require_relative 'splite'
require_relative 'enemy'

class Boss < Enemy
  attr_accessor :judge,:life, :x, :y, :max_life, :count, :vx, :vy, :attack_flag, :rush_flag
  def initialize(img,y)
    @moved = true
    @sound = Sound.new("resource/se/shu.wav")
    @flag = 0
    @img = img
	  @max_life = 200.0
	  @life = @max_life
	  @speed = 3
	  @x = Window.width * 2.5
	  @y = y
    @vx = @speed
    @vy = @speed
	  @point = 10000
	  @count = 0
	  @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
    @sita = 0
    @attack_flag = 0
    @rush_flag = false
    @takkul_flag = 0
  end
  
  def move
    if !@rush_flag
      if @x > (Window.width / 2)  
        @x -= @speed
	    else
        @y += @speed
        @speed = -@speed if @y <= 0 || (@y + @img.height) >= Window.height
      end
    else
      if @x < 600 && @takkul_flag == 0
        puts "back"
        @x += @speed.abs
        if @x >= 600
          @takkul_flag = 1
        end
      elsif @takkul_flag == 1
        puts "march"
        @takkul_flag = 1
        @x -= @speed.abs * 2
        if @x <= 10
          @takkul_flag = 2
        end
      else
        @x += @speed.abs
        puts @x.to_s
        if @x > (Window.width / 2)
          @x = (Window.width / 2) - 1
          puts "stop"
          @rush_flag = false
          @takkul_flag = 0
        end
      end
    end
    judge.set(@x,@y)
  end

  def attack(x,y)
      shoot_y = get_shoot_point
      case @attack_flag
        when 0
          speedx = -3.0
          speedy = 3.0
          speedx = -speedx if @x < x 
          speedy = -speedy if get_shoot_point > y 
        
          get_point(x,y)
          bullet = Boss_Bullet.new("resource/img/effect/fire2.png",@x, get_shoot_point,@vx,@vy,speedx,speedy,@sita,false)
        when 1
          @vx = -2.5
          @vy = -0.8
          @vy = -@vy if y > get_shoot_point
          shoot_y -= 150 if (Window.height - get_shoot_point) <= 250
          speedx = 0
          speedy = 0
          bullet = Boss_Bullet.new("resource/img/effect/fire3.png",@x, shoot_y,@vx,@vy,speedx,speedy,0,true)
      
          @attack_flag = 0
        when 2
          case rand(80)
            when 0..40
              dx = 40
            when 41..60
              dx = 0
            when 61..74
              dx = 100
            when  75..79
              dx = x
        end
        if rand(2) == 0
          dy = Window.height
          speedy = -2
        else
          dy = -400
          speedy = 4
        end
        speedx = 0
        bullet = Boss_Bullet.new("resource/img/effect/fire3.png",dx,dy,0,speedy,0,-1,0,true)
        @attack_flag = 0
        # if @x > 0
          # @x -= @speed
        # else
          # if @y <= y
            # @y += @speed
          # else
            # @y -= @speed
          # end
          
        # end
          
        
        
    end

	  return bullet
  end
  
  def get_point(x,y)
    distancex = (x + 0.0 - @x).abs
    distancey = (y + 0.0 - get_shoot_point).abs
    rad = Math.atan(distancex / distancey)
    @vx = -@vx * Math.cos(rad)
    @vy = @vy * Math.sin(rad)
    
    @vx = -@vx if @x < x
    @vy = -@vy if get_shoot_point > y
    
    @sita = (rad * 180)/Math::PI
    
  
   
  end
    
  def get_shoot_point
    return (@y + (@img.height / 2) - 8)
  end
  
  def life_confirm
    return (@life / @max_life) * 100
  end
  
end