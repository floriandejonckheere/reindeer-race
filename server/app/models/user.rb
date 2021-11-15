# frozen_string_literal: true

class User < ApplicationRecord
  has_many: :score

  validates :name,
            presence: true
end
