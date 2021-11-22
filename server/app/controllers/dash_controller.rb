# frozen_string_literal: true

class DashController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Stats.new(user).dash!
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

  def user
    @user ||= User.find(params[:user_id])
  end
end
