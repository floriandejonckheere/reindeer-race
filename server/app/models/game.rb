# frozen_string_literal: true

class Game < ApplicationRecord
  STATUSES = %w(waiting ongoing finished).freeze
  COLOURS = %w(red blue green purple yellow orange pink gray).freeze
  MAX_NUMBER_PLAYERS = 8

  has_many :scores
  has_many :users,
           through: :scores

  validates :status,
            presence: true,
            inclusion: { in: STATUSES }
end
