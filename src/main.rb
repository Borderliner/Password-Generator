$LOAD_PATH << '.'
require 'GUI/gui_main'

window = GUIMain.new("PPG", 500, 570, false)
window.show
