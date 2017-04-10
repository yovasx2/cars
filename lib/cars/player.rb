module Cars
  class Player
    attr_reader :x, :y, :alive

    def initialize(window)
      @window = window
      @car = Gosu::Image.new(File.join(Gosu::Image::MEDIA_PATH, 'blue.png'))
      reset
    end

    def turn_left
      if @x > @window.padding_road
        @speed += 8 * @window.delta * @window.enemies.level
        @x -= @speed if @x > @window.padding_road + @speed
        @moved_at = Gosu::milliseconds
      end
    end

    def turn_right
      if @x < @window.padding_road + @window.road.width*2 - @car.width
        @speed += 8 * @window.delta * @window.enemies.level
        @x += @speed if @x < @window.padding_road + @window.road.width*2 - @car.width - @speed
        @moved_at = Gosu::milliseconds
      end
    end

    def update
      turn_left  if Gosu.button_down? Gosu::KB_LEFT
      turn_right if Gosu.button_down? Gosu::KB_RIGHT
      reset_speed
    end

    def draw
      @car.draw(@x, @y, ZOrder::CAR)
    end

    def height
      @car.height
    end

    def width
      @car.width
    end

    def kill
      @alive = false
    end

    private

    def reset
      @x     = @window.padding_road + rand(@window.road.width * 2 - @car.width)
      @y     = @window.height - @car.height - 20
      @alive = true
      @moved_at = Gosu::milliseconds
      @speed = @window.enemies.level
    end

    def reset_speed
      @speed = @window.enemies.level if(Gosu::milliseconds > @moved_at + @window.delta)
    end
  end
end
