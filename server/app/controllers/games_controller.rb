# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    # will test and clean this up in the next hackaton
    waiting_lobby_games = Score
      .joins(:game)
      .where(game: { status: :waiting })
      .group_by(:game_id)

    waiting_loby = waiting_lobby_games.find { |game| game.size < 8 }

    if waiting_loby.nil?
      waiting_loby = Game.create!

      colours = Game::COLOURS.each_with_object({}) do |colour, _hash|
        hsh[colour] = true
      end

    else
      used_colours = Score.where(game_id: waiting_loby.id).pluck(:colour)
      unused_colours Game::COLOURS - used_colours

      used_colours_hash = used_colours.each_with_object({}) do |colour, _hash|
        hsh[colour] = true
      end

      unused_colours_hash = unused_colours.each_with_object({}) do |colour, _hash|
        hsh[colour] = false
      end

      colours = used_colours.merge(unused_colours)

    end
    payload = {
      colours: colours,
      game_id: waiting_loby.id,
    }

    render json: payload
  end

  def user
    ActiveRecord::Base.transaction do
      user = User.create!(create_user_params.fetch(:name))

      Score.create!({
                      user: user,
                      game: Game.find(params[:game_id]),
                      colour: create_user_params.fetch(:colour),
                    })
    end

    render json: user, status: :created
  end

  private

  def create_user_params
    params
      .permit(
        :name,
        :colour,
      )
  end
end
