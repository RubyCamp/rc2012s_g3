# coding: shift_jis


require_relative '../lib/image'

class Sentaku
  def initialize
    @img_matz = Image.new(60,200,"resource/img/matz.png")
	@img_matz2 = Image.new(60,300,"resource/img/matz2.png")
	
	@cursor = Image.load("resource/img/item/ruby.png")
	@x = 150
	@y = 200
	@selected_c = "resource/img/matz.png"
	

	@words = [
			"【キャラクター選択】",
			"プレイヤーキャラを選んでください。",
			"",
			"",
			"",
			"",
			"",
			"",
			"",
			"【スペースを押してゲームスタート】",
			""
	]
	@descriptions = []
    @words.each_with_index do |word,i|
      @descriptions[i] = Word.new(word,70 + i * 40,24)
	end
  end
	
  def play
    if Input.keyPush?(K_SPACE)
	  Scene.scenes[:game].player.img=Image.load(@selected_c)
	  Scene.set_scene(:game)
	end
	@img_matz.draw
	@img_matz2.draw
	Window.draw(@x,@y,@cursor)
	if Input.keyPush?(K_UP)
	  @selected_c = "resource/img/matz.png"
	  @y = 200
	end
	if Input.keyPush?(K_DOWN)
	  @selected_c = "resource/img/matz2.png"
	  @y = 300
	end
	
	@descriptions.each do |description|
      description.draw
	end
  end
end
