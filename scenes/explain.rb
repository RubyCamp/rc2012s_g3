# coding: shift_jis

require_relative '../lib/word'
require_relative '../lib/image'

class Explain
  def initialize
    @title = Word.new("���炷��",500,64)
    @words = [
			" ���������]�s�ɁA�܂��Ƃ䂫�Ђ�(�ȉ��AMatz)",
			"�Ƃ������̋Z�p�҂����܂����B",
			"",
			"",
			"�@20XX�N�ARuby Conference���J�Â���܂��B",
			"�����ŁAMatz�͎����Ύ�����U�������Ƃɂ��܂����B",
			"",
			"",
			" �������A�ޗ����W�߂邽�߁A�F�l�ɗ������Ƃ��܂������A",
			"�݂ȑ��Z�̂��߁A���狙�ɏo�邱�ƂɌ��߂܂����B",
			"",
			"",
			"�@�����ŁAMatz�͎����������@�uRuby�v���g���A",
			"�Ԃ����A�o�����܂����B",
			"",
			"",
			"�y�X�y�[�X�������đ�����@�ցz",
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
