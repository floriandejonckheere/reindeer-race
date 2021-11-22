# frozen_string_literal: true

class StopJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Return if no ongoing game found
    return unless game

    game.transaction do
      # Stop game
      game.update!(status: :finished, end_date: DateTime.current)

      # Save player stats
      game.scores.each { |score| score.update!(score: user.stats.dashes) }
    end
  end

  private

  def game
    @game ||= Game
      .where(status: :ongoing)
      .order(created_at: :desc)
      .first
  end
end
