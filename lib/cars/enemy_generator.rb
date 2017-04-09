module Cars
  class EnemyGenerator
    attr_reader :score, :level

    def initialize(window)
      @window  = window
      @gap     = 0
      @enemies = []
      @score   = 0
      @level   = 1
    end

    def update
      add_enemy if @gap % @window.height == 0
      @gap += 2
      update_enemies(level)
      delete_passed_enemies
      @level = 1 + @score / 50
    end

    def draw
      draw_enemies
    end

    def collision?(player)
      collided = false
      @enemies.each do |enemy|
        collided ||= enemy.collision?(player)
      end
      collided
    end

    private

    def add_enemy
      @enemies << Enemy.new(@window)
    end

    def delete_passed_enemies
      @score += 10 unless @enemies.select { |enemy| enemy.passed? }.empty?
      @enemies.reject! { |enemy| enemy.passed? }
    end

    def draw_enemies
      @enemies.each { |enemy| enemy.draw }
    end

    def update_enemies(level)
      @enemies.each { |enemy| enemy.update(level) }
    end
  end
end