module Cars
  class Enemy
    attr_reader :x, :y

    def initialize(window)
      @window = window
      @car    = Gosu::Image.new(File.join(Gosu::Image::MEDIA_PATH,'red.png'))
      col     = rand(3)
      # Center car in road
      @x      = window.padding_road + rand(window.road.width*2-@car.width)
      @y      = -@car.height
    end

    def update(level)
      speed = level * 2
      @y += speed
    end

    def draw
      @car.draw(@x, @y, ZOrder::CAR)
    end

    def passed?
      @y >= @window.height
    end

    def height
      @car.height
    end

    def width
      @car.width
    end

    def collision?(other)
      x_collision = other.x < @x && @x < other.x + @car.width ||
      other.x < @x + @car.width && @x + @car.width < other.x + @car.width
      y_collision = other.y < @y && @y < other.y + @car.height ||
      other.y < @y + @car.height && @y + @car.height < other.y + @car.height
      x_collision && y_collision
    end
  end
end