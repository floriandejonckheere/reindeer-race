# frozen_string_literal: true

class LeaderbordController < ApplicationController
  def index
    leaderbord = Score.includes(:user, :game).order(score: :desc).first(5)

    render json: leaderbord
  end
end
