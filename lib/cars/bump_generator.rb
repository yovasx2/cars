module Cars
  class BumpGenerator
    def initialize(window)
      @left    = Gosu::Image.new(File.join(Gosu::Image::MEDIA_PATH, 'left.png'))
      @right   = Gosu::Image.new(File.join(Gosu::Image::MEDIA_PATH, 'right.png'))
      @window  = window
      @y1, @y2 =-window.height, 0
    end

    def update
      @y1 += @window.enemies.level*3
      @y2 += @window.enemies.level*3
      # If bump is not visible, queue it inthe top
      @y2 = -@window.height if @y2 >= @window.height
      @y1 = -@window.height if @y1 >= @window.height
    end

    def draw
      left_padding  = @window.padding_road - @left.width
      right_padding = @window.back.width - @window.padding_road

      # Hidden
      @left.draw(left_padding, @y1, ZOrder::DECORATION)
      @right.draw(right_padding, @y1, ZOrder::DECORATION)

      # Visible
      @left.draw(left_padding, @y2, ZOrder::DECORATION)
      @right.draw(right_padding, @y2, ZOrder::DECORATION)
    end
  end
end