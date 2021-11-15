# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :scores

  validates :status,
            presence: true
end
