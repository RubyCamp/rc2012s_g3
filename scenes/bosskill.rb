# coding: shift_jis

require_relative '../lib/image'
require_relative '../lib/word'
require_relative 'game/player'
require_relative 'game/enemy'
require_relative 'game/shijimi'
require_relative 'game/suzuki'
require_relative 'game/map'
require_relative 'game/item'
require_relative 'game/boss'
require_relative 'game/boss_bullet'


class Bosskill
  def initialize
    @player = Player.new("resource/img/matz.png",@map)
    @boss_img = Image.load("resource/img/enemy/yamata.png")
    @boss = Boss.new(@boss_img, (Window.height / 2) - 130)
    @bossbomber_flag = 0
    @bom_counter = 0
    @bom_sound1 = Sound.new("resource/se/bom_1.wav")
    @bom_sound2 = Sound.new("resource/se/bom_2.wav")
    @sound_flag = 0
    @r = 255
    @g = 255
    @b = 255
  end
  
  def play
    Scene.set_scene(:ending) if Input.keyPush?(K_SPACE)

    Window.bgcolor = [@r,@g,@b]
    if @r > 50
      @r -= 2
      @g -= 2
      @player.x = -50
      @boss.x = 650
    else
      @player.draw
      if @player.x < 50
        @player.x += 1 
      else
        @boss.draw

        @bom_counter += 1
        if @bom_counter % 30 == 1
          @bomber1 = Image.new(@boss.x + rand(200),@boss.y + rand(200),"resource/img/effect/bom_2.png")
          @bomber2 = Image.new(@boss.x + rand(200),@boss.y + rand(200),"resource/img/effect/bom_2.png")
          @bomber3 = Image.new(@boss.x + rand(200),@boss.y + rand(200),"resource/img/effect/bom_2.png")
          @bom_sound1.play if @bom_counter < 60 * 5
        end
        @bomber1.draw
        @bomber2.draw
        @bomber3.draw
        if @bom_counter > 60 * 5
          if @sound_flag == 0
            @bom_sound2.play 
            @boss = Boss.new(Image.load("resource/img/effect/bom_1.png"), (Window.height / 2) - 130)
          end
          @sound_flag = 1
          @boss.x = 340
        end

        if @boss.x > 350
          @boss.x -= 2
          @boss.y += rand(5) - 2          
        else
          @boss_bomber_flag = 1
        end
        if @boss_bomber_flag == 1
          @boss.x += rand(20) - 10
          @boss.x = 350 if @boss.x > 380 || @boss.x < 320
          @boss.y += rand(20) - 10
          @boss.y = 240 / 2 if @boss.y > 300 / 2 || @boss.y < 200 / 2
        end
                
        if @bom_counter > 60 * 9
          Window.bgcolor = [0,0,0]
          Scene.set_scene(:introduce) 
        end
        
      end
    end
  end
end