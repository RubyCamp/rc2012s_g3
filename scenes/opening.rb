# coding: shift_jis

require_relative '../lib/image'
require_relative '../lib/word'

#Word.new�ŕ������쐬
#�����Łi����,y���W,�����T�C�Y,�F�j���w��\
#�F��Util::�F��(�啶��)�Ŏw��B�ڂ�����lib/util.rb�Q��
#����������̃C���X�^���X�ϐ��́Adraw�̃��\�b�h�ŕ\��
#����������̃C���X�^���X�ϐ��́Amove�̃��\�b�h�ŉ������ɃX�N���[���B�����ŃX�s�[�h

class Opening
def initialize
    @title = Word.new("�܂�����[�ƁI",30,64,Util::RED)
    @description = Word.new("�X�y�[�X�L�[�������ĊJ�n���Ă�������",400,32,Util::YELLOW)
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

