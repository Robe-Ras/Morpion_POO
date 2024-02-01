require 'bundler'
Bundler.require


class Player
  attr_reader :name, :symbol, :color

  def initialize(name, symbol, color)
    @name = name
    @symbol = symbol
    @color = color
  end

  def to_s
    "\e[#{@color}m#{@name}\e[0m"
  end

end

