$LOAD_PATH << '..'
require "Modules/crypt"

class GUIMain < Shoes

  def initialize(title = "Application", width = 640, height = 480, resizable = false)
    @width = width
    @height = height
    @title = title
    @resizable = resizable
  end

  def show
    @app = Shoes.app :width => @width, :height => @height, :title => @title, :resizable => @resizable do
      background white

      stack :margin => 16 do #Outer Frame
        stack :margin => 8, :width => "100%" do #Title
          tagline "Psyringe's Password Generator", :align => "center"
        end

        stack :margin => 8, :margin_left => 64, :margin_right => 64, :width => "100%" do #Alias Textbox
          para "Alias"
          @alias = edit_line :text => "google.com", :width => "100%"
        end

        stack :margin => 8, :margin_left => 64, :margin_right => 64, width => "100%" do #Secret Textbox
          para "Secret"
          @secret = edit_line :text => "", :width => "100%", :secret => true
          @generate = button "Generate", :width => "100%", :margin_top => 16
        end

        image "Assets/Image/Arrow.png", :margin_left => "48%", :margin_top => 16 #Arrow Image

        stack :margin => 8, :margin_left => 64, :margin_right =>64, width => "100%" do #Password Textbox
          para "Password"
          @password = edit_box :height => 128, :width => "100%"
          @copy_clipboard = button "Copy to Clipboard", :width => "100%", :margin_top => 16
        end
      end

      #Actions
      @generate.click do
        shifted_text = @alias.text << '@' << @secret.text
        @password.text = Crypt.sha1_base64(shifted_text)
      end

      @copy_clipboard.click do
        app.clipboard = @password.text
        alert "Password was copied to clipboard!"
      end
    end
  end
end
