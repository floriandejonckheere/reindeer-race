# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    ActiveRecord::Base.transaction do
      user = User.create!(name: create_user_params.fetch(:name))

      Score.create!({
                      user: user,
                      game: game,
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

  def game
    @game ||= Game.find(params[:game_id])
  end
end
