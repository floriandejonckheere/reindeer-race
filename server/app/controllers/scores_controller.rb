# frozen_string_literal: true

class ScoresController < ApplicationController

  def index
    scores = Score
      .where(game_id: game.id)
      .reduce [] do |array, score|
        hsh = {
          score: score.score,
          username: score.user.name
        }
        array << hsh
      end
    byebug
    payload = {
      scores: scores,
      game_id: game.id,
    }

    render json: payload
  end

  private

  def game
    @game ||= Game.find(params[:game_id])
  end
end
