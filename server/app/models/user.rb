# frozen_string_literal: true

class User < ApplicationRecord
  has_many :scores
  has_many :games,
           through: :scores

  validates :name,
            presence: true
end
