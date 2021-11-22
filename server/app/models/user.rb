# frozen_string_literal: true

class User < ApplicationRecord
  has_many :scores,
           dependent: :destroy

  has_many :games,
           through: :scores

  validates :name,
            presence: true,
            uniqueness: true
end
