require 'bundler'
Bundler.require



class Board
  attr_accessor :cases

  def initialize
    @cases = create_board
  end


  def create_board  # Je crée la grille
    board = {}      # Je crée un hash vide qui représente la grille
    ('A'..'C').each do |col| # Je crée mes colonnes
      (1..3).each do |row|   # Je crée mes rangées
        position = "#{col}#{row}" # Je crée le combo chiffre/lettre qui représentera la position de la case (ex : A1, B2, C3)
        board[position] = BoardCase.new(position) # Je crée une instance de BoardCase à la position défini et je l'ajoute dans le hash board (que j'utiliserai dans show.rb)
      end
    end
    board
  end


  def valid_move?(choice) # Je crée la méthode valid_move pour revérifier si le choix de la case est valide
    @cases[choice].value == " "
  end


  def play_turn(player) # Je crée la méthode play_turn pour définir le choix de case du joueur
    puts ""
    puts "#{player.name}, Choisis une case ? par exemple A1, B2, C3, etc..."
    choice = gets.chomp.upcase

    if valid_move?(choice) # Je crée la méthode valid_move pour revérifier si le choix de la case est valide et passer au tour suivant
      @cases[choice].value = player.symbol
    else
      puts ""
      puts "Choisis une case vide, imbécile ! 😠"
      play_turn(player) # permet de passer au tour suivant (def turn dans le fichier game.rb)
    end
  end


  def victory?   # Je crée les combinaisons gagnantes pour vérifier si un joueur à gagner la partie
    victory_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [6, 4, 2], [0, 4, 8]
    ]

    victory_combinations.each do |combo|    # Je crée une boucle à partir des combinaisons gagnantes, avec comme variable combo qui représente chaque élément
      values = combo.map { |index| @cases[@cases.keys[index]].value } # Je crée un tableau values en utilisant .map, qui utilise chaque index de la combinaison pour acceder à sa valeur correspondante dans @case et les stocker dans values
      return true if values.uniq.length == 1 && values[0] != " " # Je vérifie si toutes les valeurs dans values sont identiques (c'est-à-dire qu'il y a une victoire) et que la première valeur n'est pas une case vide 
    end                                                          # true = combinaison gagnante trouvé

    false
  end

end
