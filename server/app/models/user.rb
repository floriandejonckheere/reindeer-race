# frozen_string_literal: true

class User < ApplicationRecord
  has_many :scores

  validates :name,
            presence: true
end
