#coding:utf-8

require 'dxruby'
require 'dxrubyex'
require_relative 'lib/scene'

Window.caption = "Matz shoot"
Window.width   = 640
Window.height  = 480

Scene.load_scenes
Scene.set_scene(:opening)

Input.setRepeat(10,2)

Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.play
end