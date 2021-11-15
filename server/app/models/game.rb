# frozen_string_literal: true

class Game < ApplicationRecord
  SCORES = %w(waiting ongoing finished).freeze

  has_many :scores

  validates :status,
            presence: true,
            inclusion: { in: SCORES }
end
