# coding: Windows-31J
require_relative "../lib/sittin"
require_relative "../lib/Fish"
require_relative '../lib/word'

class Introduce
def initialize
#����---�摜�\��
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

  #�E��---�X�^�b�t���[��
  @title = Word.new("�����Ύ����Љ�yEnding�z",350,32,color=Util::BLUE)
  @members = []
  member = [
			" �����Ύ����i���񂶂���������j�́A�����΂Ŋl��鋛��ނ̑�\��ł���B",
			"�����΂́A�G�߂��ƂɊC���̍���������قȂ邽�߁A�Ɠ��Ȗ��o���a�������B",
			"�܂��A�V�W�~�����L���B�S���̃V�W�~���l�ʒ��A�S���������΂ɂ����̂ł���B",
			"",
			"(1)�X�Y�L",
			" �{�͔ӏH���珉�~�B�y�Î��L�z�̍�����_�b�ō�����̘a",
			"�c�����������ۂ̎����̐Ȃɓo�ꂷ��قǁA�o�_���ے�����",
			"���B�����΂ł́A�a���ŕ��ŏ����Ă��ɂ���򏑏Ă��L���B",
			"",
			"(2)�V���E�I",
			"�@�{�͏��t�B�N�x�̗ǂ����̂͂ƂĂ������������Ɍ�����B",
			"�Â����炻�̎p�́A�����̎�̎w�ɂ��Ƃ����邱�Ƃ������B",
			"���܂��`��V�Ղ炪�������߁B�]�ˎ���ɂ́A���]�̔n��",
			"�������Y�n�Ƃ���A���łɓ�������S���ł��L���������B",
			"",
			"(3)�R�C",
			" �{�͓~�G�A�Ƃ�킯2���O��̌������B",
			"�ׂ����؂����h�g�ɕ��q�i�����j�Ƙa���Đ�����Ƃ����^��",
			"�ŐH��'��̎�����'�͑�\�I�ȋ��y�����B���q���ォ��",
			"��������ɂ����āA�V�c�⏫�R�������オ��u��O�ȗ��v��",
			"�̓R�C�Ǝw�������قǂł���B",
			"",
			"(4)�E�i�M",
			" ��ʓI�ɂ悭�H�ׂ���̂́A�Ăł��邪�A�{���ɔ�������",
			"�̂́A�~�G�h�{��~�������E�i�M�B�����΂̃E�i�M�̊��Ă�",
			"�L���B�Ă����́A'�n�Ă�'�ƌĂ΂�A�o�_�������ɓ`���A",
			"�S���I�ɍL�܂����B",
			"",
			"(5)�����Q�G�r",
			"�@�{�͏H�B�����Q�G�r�Ƃ͊O�Ϗ�̓�����ǂ����������]�n����",
			"�����ŕW���a�������V�G�r�Ƃ����B�����̂Ȃ���i�Ȗ��킢����",
			"��A�ۂ��ƐH�ׂ邱�Ƃ��ł��A����g����ς��������B",
			"",
			"(6)�A�}�T�M",
			" �{��1������3���ɂ����Ă̎Y�����B�A�}�T�M�͏o�_�n���̒n����",
			"�Ń��J�T�M�̂��Ƃł���B�V�Ղ�A��ؒЂ��ȂǑ��ʂȒ������@��",
			"�H�����B���ɁA���傤��̂��Ă��A�V�Ղ炪�����B",
			"",
			"(7)�V�W�~",
			" �{�͎Y���̂��߂ɐg���삦��7���O��́w�y�p�V�W�~�x��1�`3��",
			"�̓~�G�ɋ��l�����w���V�W�~�x�ł��B",
			"�����傫���g�͓����ŁA���]�̑�\�I�Ȗ��o�̂ЂƂB���l����",
			"�S����B�n���̒��H�ɂ́A�V�W�~�`�͌������Ȃ��B�܂��A�̋@�\",
			"�񕜂̖���Ƃ��Ă��L���B",
			"",
			"(8)���}�^�m�I���`",
			" ���}�^�m�I���`�̐_�b�́A�X�T�m�I�̒Ǖ�����͂��܂�܂��B",
			"�i�����j",
			"�����łɂ��炤�̂������ɁA�X�T�m�I�͔��̓�������'���}�^",
			"�m�I���`'��ގ����ɍs���܂��B���}�^�m�I���`�̐_�b�͏�������",
			"�܂����A�������ɂ̓��}�^�m�I���`�ɂ܂��ꏊ����������܂��B",
			"",
			"",
			"���Ȃ����_�b�̃��}���������ɁA���̒n��K��Ă݂܂��񂩁B",
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
 #����---�摜�\��
   @image.each do |img|
    img.move
	img.draw
  end
 #if @cnt < 8
 # @cnt += 1.0 / 300
 #end

 #�E��---�X�^�b�t���[��
 @members.each do |i|
  i.move
  i.draw
 end
 #�I�[�v�j���O�ɖ߂�
 if Input.keyPush?(K_SPACE)
      Scene.set_scene(:ending)
    end
 
 
end
end