require 'etc'

class GUIMain < Shoes

  def initialize(title = "Application", width = 640, height = 480)
    @width = width
    @height = height
    @title = title
  end

  def center(elem)
    top=(elem.parent.height-elem.style[:height])/2
    left=(elem.parent.width-elem.style[:width])/2
    elem.move(left,top)
  end

  def show
    @app = Shoes.app :width => @width, :height => @height, :title => @title do
      background white

      stack :margin => 16 do #Outer Frame
        stack :margin => 8, :width => "100%" do #Title
          tagline "Psyringe's Password Generator", :align => "center"
        end

        stack :margin => 16, :margin_left => 64, :margin_right => 64, :width => "100%" do #Alias Textbox
          para "Alias"
          @alias = edit_line :text => Etc.getlogin, :width => "100%"
        end

        para "+", :align => "center"

        stack :margin => 16, :margin_left => 64, :margin_right => 64, width => "100%" do #Secret Textbox
          para "Secret"
          @secret = edit_line :text => "google.com", :width => "100%"
        end
      end

      #Actions
      @secret.click{
        @secret.text = ""
      }
    end

  end
end
