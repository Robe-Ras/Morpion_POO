require 'bundler'
Bundler.require



class Show
  def show_board(board)
    puts ""
    puts "Nous en sommes là :"
    puts ""
    puts "  1 | 2 | 3 "
    puts "  ---------"
    puts "A #{colorize(board.cases['A1'].value)} | #{colorize(board.cases['A2'].value)} | #{colorize(board.cases['A3'].value)} "
    puts "  ---------"
    puts "B #{colorize(board.cases['B1'].value)} | #{colorize(board.cases['B2'].value)} | #{colorize(board.cases['B3'].value)} "
    puts "  ---------"
    puts "C #{colorize(board.cases['C1'].value)} | #{colorize(board.cases['C2'].value)} | #{colorize(board.cases['C3'].value)} "
  end

  private

  def colorize(symbol)
    color_code = (symbol == 'X') ? '31' : ((symbol == 'O') ? '34' : '0')  # '31' pour rouge, '34' pour bleu, '0' pour réinitialiser
    "\e[#{color_code}m#{symbol}\e[0m"
  end
end