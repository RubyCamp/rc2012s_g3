# coding: shift_jis
require_relative "../lib/staff"
require_relative "../lib/gazou"

class Ending
def initialize
#����---�摜�\��
  @image = []
  @image[0] = Gazou.new('./resource/img/story/ending1.png')
  @image[1] = Gazou.new('./resource/img/story/ending2.png')
  @image[2] = Gazou.new('./resource/img/story/ending3.png')
  @image[3] = Gazou.new('./resource/img/story/ending4.png')

  @cnt = 0

  #@font = Font.new(50)

  #�E��---�X�^�b�t���[��
  @members = []
  member = [
			"-�X�^�b�t-",
			"��吹�j",
			"���R����",
			"�����P��",
			"���ǓT�q",
			"����m��",
			"��Ñ�N",
			"",
			"-�f�ޒ�-",
			"�O���t�B�b�N",
			"�u�C���X�gAC�v",
			"�u��؃l�b�g�v",
			"�u�t���[�C���X�g�W(��)�^�J�~�R�[�|���[�V���� �v",
			"�u�t���[�f�ށE�C���X�g�E�C�����u���V�E�_�E�����[�h/��(�h���S���Edragon)�v",
			"�u�C���X�g�����f�ނ̃C���X�g������v",
			"�u�����C���X�g�f��.com�v",
			"�u�t���[�f�ރN���b�v�A�[�g�v",
			"�u���z���݂̃c�N�c�N�����v",
			"�u���t���[�ʐ^�f�ޏW�v",
			"�u�R�A�ό�net���i�ʐ^�E�ǉ�W�v",
			"BGM",
			"�u���y�������v",
			"�u�t���[���y�f�� H/MIX GALLERY�v",
			"���ʉ�",
			"�u�����ܕW�����ʉ����C�u�����v",
			"",
			"-�X�y�V�����T���N�X-",
			"������ЃC�[�X�g�o�b�N",
			"�������NACL",
			"",
			"-����-",
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

#����---�摜�\��
 if @image[@cnt]
	@image[@cnt].draw
 end
 if @cnt < 4
  @cnt += 1.0 / 600
 end

 #�E��---�X�^�b�t���[��
 @members.each do |i|
  i.move
  i.draw
 end
 #�I�[�v�j���O�ɖ߂�
 if Input.keyPush?(K_SPACE)
      Scene.set_scene(:opening)
    end
 
 
end
end