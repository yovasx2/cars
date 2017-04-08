require 'gosu'

module Cars
  class Window < Gosu::Window
    WIDTH, HEIGHT = 800, 598
    def initialize
      super(WIDTH, HEIGHT)
      caption = "Cars"
      puts __FILE__
      binding.pry
      @background_image = Gosu::Image.new('media/back.png')
      @font = Gosu::Font.new(20)
    end

    def update

    end

    def draw
      @background_image.draw(0, 0, ZOrder::BACKGROUND)
    end
  end
end
