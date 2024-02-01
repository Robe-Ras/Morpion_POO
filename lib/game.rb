require 'bundler'
Bundler.require



class Game
  attr_accessor :current_player, :status, :board, :players

  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name, "X", "31"), Player.new(player2_name,"O", "34")]
    @board = Board.new
    @status = :ongoing
    @current_player = @players[0]
  end


  def turn # Je crée la def turn qui va me définir un tour dans le jeu
    board.play_turn(current_player) # J'appelle la méthode play_turn (dans le fichier board.rb) de l'objet board pour le joueur actuel 
    check_game_status # Je vérifie l'état du jeu (voir la def check_game_status plus bas)
    switch_turn unless game_over? # J'appelle la def switch_turn (voir plus bas) sous la condition que le jeux puisse continuer (def game_over, en bas)
  end


  def game_over? # Je crée la def game_over qui me renverra true en cas de victoire ou d'égalité
    status == :win || status == :draw
  end


  def game_end # Je crée cette méthode pour afficher le message de fin de partie
    puts "La partie est terminée !"
    if status == :draw   # Je vérifie si le jeu s'est terminé par un match nul
      puts "Égalité !" 
    else
      puts "#{current_player.name} a gagné !"
    end
  end


  def check_game_status # Je vérifie l'état du jeu Win ou grille pleine = égalité (méthode board_full en bas)
    if board.victory?
      @status = :win
    elsif board_full?
      @status = :draw
    end
  end


  def board_full? # Je vérifie si la grille est pleine
    board.cases.all? { |_, board_case| board_case.value != " " }
  end


  def switch_turn  # Je crée une méthode pour changer le joueur actuel par le joueur suivant
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end
end