# frozen_string_literal: true

class Game < ApplicationRecord
  SCORES = %w(waiting ongoing finished).freeze

  has_many :scores
  has_many :users,
           through: :scores

  validates :status,
            presence: true,
            inclusion: { in: SCORES }
end
