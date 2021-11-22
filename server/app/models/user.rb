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

# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
