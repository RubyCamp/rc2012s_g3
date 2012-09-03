# coding: shift_jis

require_relative '../lib/word'
require_relative '../lib/image'

class Story
  def initialize
    @img_matz = Image.new(60,100,"resource/img/matz.png")
	@img_ami = Image.new(150,140,"resource/img/effect/ami.png")
	@img_ruby = Image.new(130,250,"resource/img/item/ruby.png")
	@img_perl = Image.new(130,300,"resource/img/item/perl.png")
	@words = [
			"�y������@�z",
			"�J�[�\���L�[�F�\�������iMatz�j",
			"�y�L�[:�Ԃ𔭎�",
			"",
			"�y�A�C�e���z",
			"Ruby: �ԃp���[�A�b�v",
			"Perl: �ԃp���[�_�E��",
			"",
			"",
			"�y�X�y�[�X�������ăL�����I����ʂցz",
			""
	]
	@descriptions = []
    @words.each_with_index do |word,i|
      @descriptions[i] = Word.new(word,70 + i * 40,24)
	end
  end
	
  def play
	
  
    Scene.set_scene(:sentaku) if Input.keyPush?(K_SPACE)
	@img_matz.draw
	@img_ami.draw
	@img_ruby.draw
	@img_perl.draw
	@descriptions.each do |description|
      description.draw
	end
  end
end
