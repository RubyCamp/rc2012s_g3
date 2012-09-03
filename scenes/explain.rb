# coding: shift_jis

require_relative '../lib/word'
require_relative '../lib/image'

class Explain
  def initialize
    @title = Word.new("あらすじ",500,64)
    @words = [
			" 島根県松江市に、まつもとゆきひろ(以下、Matz)",
			"という名の技術者がいました。",
			"",
			"",
			"　20XX年、Ruby Conferenceが開催されます。",
			"そこで、Matzは宍道湖七珍を振舞うことにしました。",
			"",
			"",
			" しかし、材料を集めるため、友人に頼もうとしましたが、",
			"みな多忙のため、自ら漁に出ることに決めました。",
			"",
			"",
			"　そこで、Matzは自ら作った魔法「Ruby」を使い、",
			"網を作り、出発しました。",
			"",
			"",
			"【スペースを押して操作方法へ】",
    ]
    @descriptions = []
    @words.each_with_index do |word,i|
      @descriptions[i] = Word.new(word,650 + i * 40,24)
    end
  end

  def play
    Scene.set_scene(:story) if Input.keyPush?(K_SPACE)
    @title.draw
    @title.move(1.2)
    @descriptions.each do |description|
      description.draw
      description.move(1.2)
    end
  end
end
