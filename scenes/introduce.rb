# coding: Windows-31J
require_relative "../lib/sittin"
require_relative "../lib/Fish"
require_relative '../lib/word'

class Introduce
def initialize
#左側---画像表示
  @image = []
  @image[0] = Fish.new('./resource/img/shoukai/suzuki_end.png',590)
  @image[1] = Fish.new('./resource/img/shoukai/shirauo_end.png',770)
  @image[2] = Fish.new('./resource/img/shoukai/koi_end.png',950)
  @image[3] = Fish.new('./resource/img/shoukai/unagi_end.png',1150)
  @image[4] = Fish.new('./resource/img/shoukai/ebi_end.png',1320)
  @image[5] = Fish.new('./resource/img/shoukai/wakasagi_end.png',1480)
  @image[6] = Fish.new('./resource/img/shoukai/shijimi_end.png',1630)
  @image[7] = Fish.new('./resource/img/shoukai/yamata_end.png',1900)
 
#  @cnt = 0

  #@font = Font.new(50)

  #右側---スタッフロール
  @title = Word.new("宍道湖七珍紹介【Ending】",350,32,color=Util::BLUE)
  @members = []
  member = [
			" 宍道湖七珍（しんじこしっちん）は、宍道湖で獲れる魚介類の代表種である。",
			"宍道湖は、季節ごとに海水の混じり方が異なるため、独特な味覚が誕生した。",
			"また、シジミ漁が有名。全国のシジミ漁獲量中、４割が宍道湖によるものである。",
			"",
			"(1)スズキ",
			" 旬は晩秋から初冬。【古事記】の国譲り神話で国譲りの和",
			"議が成立した際の酒宴の席に登場するほど、出雲を象徴する",
			"魚。宍道湖では、和紙で包んで蒸し焼きにする奉書焼が有名。",
			"",
			"(2)シラウオ",
			"　旬は初春。鮮度の良いものはとても美しく透明に見える。",
			"古くからその姿は、女性の手の指にたとえられることが多い。",
			"すまし汁や天ぷらがおすすめ。江戸時代には、松江の馬潟",
			"沖が名産地とされ、すでに当時から全国でも有名だった。",
			"",
			"(3)コイ",
			" 旬は冬季、とりわけ2月前後の厳寒期。",
			"細かく切った刺身に腹子（卵巣）と和えて煎り酒というタレ",
			"で食す'鯉の糸造り'は代表的な郷土料理。鎌倉時代から",
			"明治時代にかけて、天皇や将軍が召し上がる「御前科理」に",
			"はコイと指名されるほどである。",
			"",
			"(4)ウナギ",
			" 一般的によく食べられるのは、夏であるが、本当に美味しい",
			"のは、冬季栄養を蓄えた寒ウナギ。宍道湖のウナギの蒲焼が",
			"有名。焼き方は、'地焼き'と呼ばれ、出雲から上方に伝わり、",
			"全国的に広まった。",
			"",
			"(5)モロゲエビ",
			"　旬は秋。モロゲエビとは外観上の特徴を良く捉えた松江地方の",
			"方言で標準和名をヨシエビという。くせのない上品な味わいがあ",
			"り、丸ごと食べることができ、から揚げや煮つけが美味。",
			"",
			"(6)アマサギ",
			" 旬は1月から3月にかけての産卵期。アマサギは出雲地方の地方名",
			"でワカサギのことである。天ぷら、南蛮漬けなど多彩な調理方法で",
			"食される。特に、しょうゆのつけ焼き、天ぷらが美味。",
			"",
			"(7)シジミ",
			" 旬は産卵のために身が肥えた7月前後の『土用シジミ』と1～3月",
			"の冬季に漁獲される『寒シジミ』です。",
			"粒が大きく身は肉厚で、松江の代表的な味覚のひとつ。漁獲高は",
			"全国一。地元の朝食には、シジミ汁は欠かせない。また、肝機能",
			"回復の妙薬としても有名。",
			"",
			"(8)ヤマタノオロチ",
			" ヤマタノオロチの神話は、スサノオの追放からはじまります。",
			"（中略）",
			"娘を嫁にもらうのを条件に、スサノオは八つの頭をもつ竜'ヤマタ",
			"ノオロチ'を退治しに行きます。ヤマタノオロチの神話は諸説あり",
			"ますが、島根県にはヤマタノオロチにまつわる場所も多くあります。",
			"",
			"",
			"あなたも神話のロマンを感じに、この地を訪れてみませんか。",
  ]
  i = 480
  for name in member do
   @members << Sittin.new(name, i)
   i += 30
  end

  @sound = Sound.new("resource/bgm/ending.mid")
  @sound_flag = 0
end

def play
  @sound.play if @sound_flag == 0
  @sound_flag = 1
  
  @title.draw
  @title.move(0.8)
 #左側---画像表示
   @image.each do |img|
    img.move
	img.draw
  end
 #if @cnt < 8
 # @cnt += 1.0 / 300
 #end

 #右側---スタッフロール
 @members.each do |i|
  i.move
  i.draw
 end
 #オープニングに戻る
 if Input.keyPush?(K_SPACE)
      Scene.set_scene(:ending)
    end
 
 
end
end