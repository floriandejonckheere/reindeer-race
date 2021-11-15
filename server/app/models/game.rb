# frozen_string_literal: true

class Game < ApplicationRecord
  has_many: :score

  validates :status,
            presence: true
end
