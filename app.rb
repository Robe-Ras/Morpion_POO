require_relative 'lib/boardcase'
require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'show'

require 'bundler'
Bundler.require



class App
  def perform

    puts "Voici le jeu du MORPION !"
    puts ""

    puts "Joueur 1 entre ton nom"
    player1_name = gets.chomp
    puts ""

    puts "Joueur 2 entre ton nom"
    player2_name = gets.chomp
    puts ""

    player1 = Player.new(player1_name, "X", "31") # Je crée une instance de la classe Player pour le joueur1 (son nom) et son symbole (X)
    player2 = Player.new(player2_name, "O", "34") # Je crée une instance de la classe Player pour le joueur2 (son nom) et son symbole (O)
  

    game = Game.new(player1, player2)       # Je crée une instance de la classe Game avec les deux joueurs créés.
    show = Show.new                         # Je crée une instance de la classe Show pour afficher le plateau de jeu à différents stades du jeu

    

    while game.status == :ongoing  # Je crée une boucle while qui continuera tant que le statut du jeu (game.status) est en cours
      show.show_board(game.board)
      game.turn
    end

    show.show_board(game.board)   # montre le tableau une dernière fois avec la combinaison gagnante
    game.game_end
  end
end

App.new.perform