class PlayerCharactersController < ApplicationController

  def index
    @player_characters = PlayerCharacter.all
  end

  def show
    @player_character = PlayerCharacter.find(params[:id])
  end

  def new
    @player_character = PlayerCharacter.new
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)
  end

  def edit
    @player_character = PlayerCharacter.find(:id)
  end

  def update
  end

  private

  def player_character_params
    params.require(:pc).permit(:name, :level, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma)
  end

end
