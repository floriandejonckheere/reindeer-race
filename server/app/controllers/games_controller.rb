# frozen_string_literal: true

class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # will test and clean this up in the next hackaton
    waiting_loby = Game
      .where(status: :waiting )
      .find { |game| game.users.size < 8 }

    if waiting_loby.nil?
      waiting_loby = Game.create!

      colours = Game::COLOURS.each_with_object({}) do |colour, hash|
        hash[colour] = true
      end

    else
      used_colours = Score.where(game_id: waiting_loby.id).pluck(:colour)
      unused_colours = Game::COLOURS - used_colours

      used_colours_hash = used_colours.each_with_object({}) do |colour, hash|
        hash[colour] = true
      end

      unused_colours_hash = unused_colours.each_with_object({}) do |colour, hash|
        hash[colour] = false
      end

      colours = used_colours_hash.merge(unused_colours_hash)
    end

    payload = {
      colours: colours,
      game_id: waiting_loby.id,
    }

    render json: payload
  end

  def show
    payload = {
      raindeers: game.users,
      status: game.status
    }

    render json: payload
  end

  private

  def create_user_params
    params
      .permit(
        :name,
        :colour,
      )
  end

  def game
    @game ||= Game.find(params[:id])
  end
end
