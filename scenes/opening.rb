# coding: shift_jis

require_relative '../lib/image'
require_relative '../lib/word'

#Word.newで文字を作成
#引数で（文字,y座標,文字サイズ,色）を指定可能
#色はUtil::色名(大文字)で指定。詳しくはlib/util.rb参照
#作った文字のインスタンス変数は、drawのメソッドで表示
#作った文字のインスタンス変数は、moveのメソッドで下から上にスクロール。引数でスピード

class Opening
def initialize
    @title = Word.new("まっつしゅーと！",30,64,Util::RED)
    @description = Word.new("スペースキーを押して開始してください",400,32,Util::YELLOW)
	@img_matz = Image.new(120,40,"resource/img/matz_kara.png")
	@img_sinjiko = Image.new(0,0,"resource/img/sinjiko.png")
end

def play
    Scene.set_scene(:explain) if Input.keyPush?(K_SPACE)
	@img_sinjiko.draw
    @img_matz.draw
    @title.draw
    @description.draw
	end
end

