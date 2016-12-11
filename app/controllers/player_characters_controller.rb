class PlayerCharactersController < ApplicationController

  def index
    @player_characters = PlayerCharacter.all
  end

  def show
    @player_character = PlayerCharacter.includes(:alignment, :race).where(id: params[:id]).first
  end

  def new
    @player_character = PlayerCharacter.new
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)
    if @player_character.save
      redirect_to @player_character
    else
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
