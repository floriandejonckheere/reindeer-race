# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :taps, presence: true
  validates :colour, presence: true
end
