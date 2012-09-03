require_relative 'game/player'
require_relative 'game/enemy'
require_relative 'game/shijimi'
require_relative 'game/suzuki'
require_relative 'game/ebi'
require_relative 'game/amasagi'
require_relative 'game/koi' #add
require_relative 'game/unagi' #add
require_relative 'game/map'
require_relative 'game/item'
require_relative 'game/boss'
require_relative 'game/boss_bullet'

class Game
  attr_accessor :player
  def initialize
	  @map = Map.new("resource/img/map.png","resource/img/item/life.png","resource/img/item/ruby.png","resource/bgm/map.mid")  
    @player = Player.new("resource/img/matz.png",@map)
    @bullets = []
	  @enemy_bullets = []
    @count_time = 0
	  @enemy_count_time = 0
    @shijimis = []
    @ebies = []
	  @suzukis = []
    @amasagis = []
    @kois = [] #add
    @unagis = [] #add
	  @bosses = []
    @boss_flag = false
    @attack_count = 0
    @boss_point = 50
    @suzuki_flag = false
    @shijimi_flag = true
    random = 0
    
    
    @hoimi_correct = "hoimi"
    @hoimi = ["","","","",""]
    @input = [K_H,K_O,K_I,K_M,K_Z]
    @key_h = 35
    @key_o = 24
    @key_i = 23
    @key_m = 50
    @key_z = 44
	
	  shijimi_img = Image.load("resource/img/enemy/shijimi.png")
	  suzuki_img = Image.load("resource/img/enemy/suzuki.png")
    ebi_img = Image.load("resource/img/enemy/ebi.png")
	  boss_img = Image.load("resource/img/enemy/yamata.png")
    amasagi_img = Image.load("resource/img/enemy/wakasagi.png")
    koi_img = Image.load("resource/img/enemy/koi.png") #add
	  unagi_img = Image.load("resource/img/enemy/unagi.png") #add
	
	  10.times do
	    shijimi = Shijimi.new(shijimi_img,50 + rand(Window.height - 150))
	    shijimi.moved = rand(2) == 0 ? true : false
	    @shijimis << shijimi
    end	
	
	  3.times do
	    suzuki = Suzuki.new(suzuki_img,50 + rand(Window.height - 150))
      if @suzuki_flag
	      suzuki.moved = rand(2) == 0 ? true : false
      else
        suzuki.moved = false
      end
	    @suzukis << suzuki
	  end
    
    3.times do
      ebi = Ebi.new(ebi_img,50 + rand(Window.height - 150))
      ebi.moved = false#rand(2) == 0 ? true : false
      @ebies << ebi
    end
    
    2.times do
      amasagi = Amasagi.new(amasagi_img,50 + rand(Window.height - 150))
      amasagi.moved = false#rand(2) == 0 ? true : false
      @amasagis << amasagi
    end
    1.times do
	    koi = Koi.new(koi_img,400)
	    koi.moved = rand(2) == 0 ? true : false
	    @kois << koi
	  end
    
    
    2.times do
	    unagi = Unagi.new(unagi_img,50 + rand(Window.height - 150))
	    unagi.moved = rand(2) == 0 ? true : false
	    @unagis << unagi
	  end
	
	  @boss = Boss.new(boss_img, (Window.height / 2) - 130)
	  @bosses << @boss
	
	  @shijimis = exist(@shijimis)
    if @suzuki_flag
	    @suzukis = exist(@suzukis)
    end
    
    @ebies = exist(@ebies)
    @amasagis = exist(@amasagis)
	  @kois = exist(@kois) #add
    @unagis = exist(@unagis) #add
  end
  
  def play
  
    @input.each do |key|
      if Input.keyPush?(key)
        @hoimi.shift
        case key
        when @key_h
        @hoimi << "h"
        when @key_o
        @hoimi << "o"
        when @key_i
        @hoimi << "i"
        when @key_m
        @hoimi << "m"
        when @key_z
        @hoimi << "z"
        else
        end
      end
    end
    
    if @hoimi.join == @hoimi_correct
      @hoimi[0] = "z"
      @player.hoimi
    end
  
    @map.draw
	
	  @player.draw if @player.muteki_counter > 60
    @player.draw if @player.muteki_counter % 4 == 1
	
    @player.move
	  @player.muteki
    
    
    
	
  if @map.point >= 30
    @suzukis = put_suzuki
    @suzuki_flag = true
  end
  
  @shijimi_flag == false if @map.point == 50
	
	enemy_attack(@shijimis)
	enemy_attack(@suzukis)
  enemy_attack(@ebies)
  enemy_attack(@amasagis)
	enemy_attack(@kois) #add
  enemy_attack(@unagis) #add
	
	enemy_attack(@bosses) if @boss_flag
	  
	  
	
	
	@enemy_bullets.each do |bullet|
	  bullet.draw
	  bullet.move
	end
 	
    if Input.keyPush?(K_Z) and @count_time == 0
      if @player.level > 1
        ary = @player.double_attack
        ary.each do |b|
          @bullets << b
        end
      else
        @bullets << @player.attack
      end
        @count_time = 1
    end
    
	@map.life = @player.life
	@map.level = @player.level
	
    @count_time += @player.attack.charge if @count_time >= 1 #ADDDDDDDD
    @count_time = 0 if @count_time >= 20
	
	
	@enemy_count_time += 1 if @enemy_count_time >= 1
    @enemy_count_time = 0 if @enemy_count_time >= 10
	
	boss_appear if @map.point >= @boss_point
    
  end
  
  
  def exist(ary)
    ary[0].moved = true
	return ary
  end
  
  def enemy_attack(enemies)
	  enemies.each do |enemy|
	    if enemy.moved?
    	  enemy.draw
	      enemy.move
        if enemy.item
          if enemy.life < 0
            enemy.item.draw(enemy.item_x,enemy.item_y,enemy.item.img)
            enemy.item.judge.set(enemy.item_x,enemy.item_y)
            enemy.x = 1
          end
          if Collision.check(@player.judge,enemy.item.judge)
            enemy.item.get(@player)
            enemy.x = -1
            enemy.item.judge.set(-1000,1000)
            enemy.item = nil
          end
        end      
                
		    if enemy.class == Suzuki || enemy.class == Boss  || enemy.class == Unagi
		      enemy.boss_move if @boss_flag
		      if enemy.count == 0
            #p enemy.class
			      unless enemy.class == Boss
		          @enemy_bullets << enemy.attack
			      else
			        puts enemy.life_confirm
			        if enemy.life_confirm % 30 == 1.0 || enemy.life_confirm % 30 == 0.5
                enemy.rush_flag = true
                enemy.life -= 1.0
              end
			        if !enemy.rush_flag
                if @attack_count > 20   #Boss attack of special
                  enemy.attack_flag = rand(2)+1
                  @attack_count = 0
                end
			          @enemy_bullets << enemy.attack(@player.x,@player.y)
                @attack_count += 1
              end
			      end
		        @enemy_count_time = 1
		      end
		      enemy.count += 1
          if enemy.class == Boss
            if enemy.life >= 100
		          enemy.count = 0 if enemy.count > 30
            elsif enemy.life >= 60
              enemy.count = 0 if enemy.count > 20
            else
              enemy.count = 0 if enemy.count > 5
            end
          else
            enemy.count = 0 if enemy.count > 100
          end
		    end
	      @player.damage if Collision.check(@player.judge,enemy.judge)
        delete_enemy_bullets = []
		    @enemy_bullets.each do |e_bullet|
          if Collision.check(@player.judge,e_bullet.judge)
		        @player.damage
		        e_bullet.kill
			      delete_enemy_bullets << e_bullet
		      end
		    end
        
        @enemy_bullets -= delete_enemy_bullets
        delete_bullets = []
        @bullets.each do |bullet|
          bullet.move unless enemy.class == Boss
		      bullet.move if enemy.class == Boss
          bullet.draw
          if Collision.check(enemy.judge,bullet.judge)
            if enemy.damage(@map)
              enemy.moved = false
		  	      enemies.each do |e|
                unless e.moved
			  	        if !@boss_flag
                    #if (e.class == Shijimi && @shijimi_flag) || (e.class == Suzuki && @suzuki_flag)
                      
				              e.moved = (rand(1) == 0 ? true : false)
                    #end
				          end
                end				
			        end
			      end
            bullet.kill
			      delete_bullets << bullet
          end
		      unless bullet == nil
		        if bullet.x > Window.width
		          delete_bullets << bullet
              
		        end
		      end
		    end
        
        @bullets -= delete_bullets
	      if enemy.x <= 0
	        enemy.moved = false
          enemy.x = Window.width
          enemy.y = rand(Window.height - (enemy.get_height + 50)) + 50
          enemy.life = enemy.max_life
     	    enemies.each do |e|
            unless e.moved
			        if !@boss_flag
                e.moved = (rand(1) == 0 ? true : false)
			        end
            end				
		      end
        end	
      end
	  end
  end  #   end of method
  
  
  def boss_appear
    @boss_flag = true
  end
  
  def get_ypoint
    begin
      random = rand(Window.height - 100)
    end while random > 50
  end
  
  def put_suzuki
    return exist(@suzukis)
  end
	
    
  
  
  
  
  
  
    
  
  
  
  
  
end