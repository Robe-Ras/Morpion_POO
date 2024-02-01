require 'bundler'
Bundler.require



class BoardCase
  attr_accessor :value, :id

  def initialize(id)
    @value = " "    #  contenu de la case (vide pour le moment)
    @id = id        #  identifiant unique de la case sur la grille  (ex : A1, C3, etc...)
  end
end