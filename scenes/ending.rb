# coding: shift_jis
require_relative "../lib/staff"
require_relative "../lib/gazou"

class Ending
def initialize
#左側---画像表示
  @image = []
  @image[0] = Gazou.new('./resource/img/story/ending1.png')
  @image[1] = Gazou.new('./resource/img/story/ending2.png')
  @image[2] = Gazou.new('./resource/img/story/ending3.png')
  @image[3] = Gazou.new('./resource/img/story/ending4.png')

  @cnt = 0

  #@font = Font.new(50)

  #右側---スタッフロール
  @members = []
  member = [
			"-スタッフ-",
			"大門聖史",
			"福山直城",
			"勝部善文",
			"世良典子",
			"西川仁将",
			"野津拓朗",
			"",
			"-素材提供-",
			"グラフィック",
			"「イラストAC」",
			"「野菜ネット」",
			"「フリーイラスト集(株)タカミコーポレーション 」",
			"「フリー素材・イラスト・イラレブラシ・ダウンロード/龍(ドラゴン・dragon)」",
			"「イラスト無料素材のイラスト屋さん」",
			"「無料イラスト素材.com」",
			"「フリー素材クリップアート」",
			"「幻想伯爵のツクツク同盟」",
			"「ゆんフリー写真素材集」",
			"「山陰観光net風景写真・壁画集」",
			"BGM",
			"「音楽研究所」",
			"「フリー音楽素材 H/MIX GALLERY」",
			"効果音",
			"「こだま標準効果音ライブラリ」",
			"",
			"-スペシャルサンクス-",
			"株式会社イーストバック",
			"株式会社NACL",
			"",
			"-制作-",
			"Matz Lovers"
  ]
  i = 480
  for name in member do
   @members << Staff.new(name, i)
   i += 70
  end

end

def play
#break if Input.keyPush?(K_ESCAPE)

#左側---画像表示
 if @image[@cnt]
	@image[@cnt].draw
 end
 if @cnt < 4
  @cnt += 1.0 / 600
 end

 #右側---スタッフロール
 @members.each do |i|
  i.move
  i.draw
 end
 #オープニングに戻る
 if Input.keyPush?(K_SPACE)
      Scene.set_scene(:opening)
    end
 
 
end
end