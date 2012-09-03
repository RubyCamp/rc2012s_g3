# coding: shift_jis
require_relative "util"

class Word
  def initialize(word,y,size=48,color=Util::WHITE)
    @font = Font.new(size, "ＭＳ ゴシック", weight: true)
    @word = word
    @color = color
    @x = center
    @y = y
  end
  
  def draw
    Window.drawFont(@x,@y,@word,@font,color: @color)
  end
  
  def move(speed=1)    
    @y -= speed if @y >= -600
  end
  
  private
  def center
    return (Window.width - @font.get_width(@word)) / 2
  end
end