class GUIMain

  def initialize(title = "Application", width = 640, height = 480)
    @width = width
    @height = height
    @title = title
  end

  def show
    Shoes.app(:width => @width, :height => @height, :title => @title){
      background white
      stack(:margin => 8){
        button "Hello guys!"
      }
    }
  end
end
