class PlayerCharactersController < ApplicationController

  def index
    @player_characters = PlayerCharacter.all
  end

  def show
    @player_character = PlayerCharacter.includes(:alignment, :race, :moves, :bonds).where(id: params[:id]).first
  end

  def new
    @player_character = PlayerCharacter.new
    @race = @player_character.build_race
    @alignment = @player_character.build_alignment
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)
    add_moves
    if @player_character.save
      redirect_to @player_character
    else
      @errors = @player_character
      render "new"
    end
  end

  def edit
    @player_character = PlayerCharacter.includes(:alignment, :race, :moves, :bonds).where(id: params[:id]).first
  end

  def update
  end

  private

  def player_character_params
    params.require(:player_character).permit(:name, :class, :level, :class_name, :hp_mod, :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, race_attributes: [:name, :description], alignment_attributes: [:name, :description])
  end

  def add_moves
    if params[:moves]
      params[:moves].each do |number, data|
        @player_character.moves << Move.new(name: data[:name], description: data[:description])
      end
    end
  end

end
