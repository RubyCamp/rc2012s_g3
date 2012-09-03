
class Map
  attr_accessor :life,:level,:draw,:point,:bgm,:sound_flag
  
  def initialize(filename,filename2,filename3,filename4)
    @map_img = Image.load(filename)
    @life_img = Image.load(filename2)
    @life = 0
    @life_x = 3
    @level_img = Image.load(filename3)
    @level = 0
    @level_x = 220
    @state_y = 3
    @point = 0
    @bgm = Sound.new(filename4)
    @sound_flag = 1
    @story_point = 10000 # このポイント以上獲得すると次のシーンへ
  end
  
  def draw
    @bgm.play if @sound_flag == 1
    @bgm.stop if @sound_flag == 2
    @sound_flag = 0
    font = Font.new(30)
    Window.draw(0, 0, @map_img)
    
    @life.times do
        Window.draw(@life_x,@state_y,@life_img)
        @life_x = @life_x + @life_img.width
    end
    @life_x = 3
    
    @level.times do
      Window.draw(@level_x,@state_y,@level_img)
      @level_x = @level_x + @level_img.width
    end
    @level_x = 220
	
    Window.drawFont(420, @state_y, "point:#{@point}", font)	
    
    if @point > @story_point
      @bgm.stop
      Scene.set_scene(:bosskill) 
    end
  end
  
  def sound
    
  end
end