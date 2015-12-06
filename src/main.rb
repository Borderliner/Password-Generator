#!/usr/bin/ruby
$LOAD_PATH << '.'
require 'GUI/gui_main'

window = GUIMain.new("Psyringe's Password Generator", 500, 570, false)
window.show
