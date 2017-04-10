module Cars
  class Window < Gosu::Window
    attr_reader :back, :padding_road, :road, :delta, :enemies

    WIDTH, HEIGHT = 800, 598

    def initialize
      super(WIDTH, HEIGHT)
      caption   = "Cars"
      reset
    end

    def update
      update_delta
      if @player.alive
        @bumps.update
        @enemies.update
        @player.update
        @player.kill if @enemies.collision?(@player)
      else
        reset  if button_down? Gosu::KB_R
      end
    end

    def draw
      draw_assets
      @bumps.draw
      @enemies.draw
      @player.draw
      @font.draw('Game Over', 300, 200, ZOrder::UI, 2, 2, Gosu::Color::BLACK) unless @player.alive
      @font.draw('Score', 20, 10, ZOrder::UI)
      @font.draw('%06i' % @enemies.score, 20, 30, ZOrder::UI)
      @font.draw('Level' % 0, 20, 70, ZOrder::UI)
      @font.draw('%02i' % @enemies.level, 20, 90, ZOrder::UI)
    end

    def button_down(id)
      id == Gosu::KB_ESCAPE ? close : super
    end

    private

    def load_assets
      @back = Gosu::Image.new(File.join(Gosu::Image::MEDIA_PATH, 'back.png'))
      @road = Gosu::Image.new(File.join(Gosu::Image::MEDIA_PATH, 'road.png'))
      @font ||= Gosu::Font.new(20)

      # Left paddings
      @padding_road = (@back.width - @road.width*2)/2
    end

    def draw_assets
      # Draw images
      @back.draw(0, 0, ZOrder::BACKGROUND)
      @road.draw(@padding_road, 0, ZOrder::DECORATION, 2)
    end

    def reset
      load_assets
      @bumps     = BumpGenerator.new(self)
      @enemies   = EnemyGenerator.new(self)
      @player    = Player.new(self)
      @last_time = 0
    end

    def update_delta
      current_time = Time.now.to_i
      @delta = [current_time - @last_time, 0.25].min
      @last_time = current_time
    end
  end
end
