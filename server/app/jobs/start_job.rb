# frozen_string_literal: true

class StartJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    # Return if no lobby with players found
    return unless game&.users&.any?

    logger.info "Starting game #{game.id} with #{game.users.count} players"

    game.transaction do
      # Start game
      game.update!(status: :ongoing, start_date: DateTime.current)

      # Reset player stats
      game.users.each { |user| user.stats.clear! }
    end
  end

  private

  def game
    @game ||= Game
      .where(status: :waiting)
      .order(created_at: :desc)
      .first
  end
end
