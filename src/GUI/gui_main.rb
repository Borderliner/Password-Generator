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
        end

        @convert = image "Asset/Image/Arrow.png", :margin_left => "48%", :margin_top => 16 #Arrow Image

        stack :margin => 8, :margin_left => 64, :margin_right =>64, width => "100%" do #Password Textbox
          para "Password"
          @password = edit_box :height => 128, :width => "100%"
        end
      end
    end
  end
end
