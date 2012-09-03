class Item < Splite
  attr_accessor :judge,:x,:y,:img
  
  def initialize(x,y,filename)
    @img = Image.load(filename)
    @x = x
    @y = y
    @speed = -4
    @judge = CollisionBox.new(self,0,0,@img.width,@img.height)
    @sound = Sound.new("resource/se/itemget.wav")
  end
  
  def move
    @x += @speed
    @judge.set(@x,@y)
    if @x < 0
      @x = 640
      @y = rand(480 - @img.height)
    end
  end
  
  def get(player)
    @sound.play
    @y = 10000
  end
  
  def draw(x,y,img)
    Window.draw(x,y,img)
  end
end

class Perl < Item
  def initialize(x,y,filename="resource/img/item/perl.png")
    super
    @img = Image.load(filename)
    @sound = Sound.new("resource/se/itai.wav")
  end
  
  def get(player)
    super
    player.level -= 1 if player.level > 0
  end
end

class Ruby < Item
  def initialize(x,y,filename="resource/img/item/ruby.png")
    super
    @img = Image.load(filename)
    @sound = Sound.new("resource/se/itemget.wav")
  end
  
  def get(player)
    super
    player.level += 1 if player.level < 3
  end
end