# coding: shift_jis

require_relative '../lib/image'
require_relative '../lib/word'
require_relative '../lib/util'

class Gameover
  def initialize
    @bgm = Sound.new("resource/bgm/gameover.wav")
    @background = Background.new("resource/img/sinjiko.png")
    @title = Word.new("GAME OVER",50,52,[66,66,66])
    @description = Word.new("スペースキーを押してタイトル画面へ",400,28)
    @sound_flag = 1
  end

	def play
    @bgm.play if @sound_flag == 1 
    @sound_flag = 0
    @background.draw
    @title.draw
    @description.draw
    if Input.keyPush?(K_SPACE)
      @bgm.stop
      @bgm.dispose
      Scene.load_scenes
      Scene.set_scene(:opening)
    end
  end
end
