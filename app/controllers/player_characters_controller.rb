class PlayerCharactersController < ApplicationController

  def index
    @player_characters = PlayerCharacter.all
  end

  def show
    @player_character = PlayerCharacter.find(params[:id])
  end

  def new
    @player_character = PlayerCharacter.new
    @attribute_array = [16,15,13,12,9,8,nil]
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)
    if @player_character.save
      redirect_to @player_character
    else
      @attribute_array = [16,15,13,12,9,8,nil]
      @errors = @player_character
      render "new"
    end
  end

  def edit
    @player_character = PlayerCharacter.find(:id)
  end

  def update
  end

  private

  def player_character_params
    params.require(:player_character).permit(:name, :level, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma)
  end

  def class_params
    params.require
  end

end
