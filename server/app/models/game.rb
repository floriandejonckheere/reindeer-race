# frozen_string_literal: true

class Game < ApplicationRecord
  STATUSES = %w(waiting ongoing finished).freeze
  COLOURS = %w(red blue green purple yellow orange pink gray).freeze
  MAX_NUMBER_PLAYERS = 8

  has_many :scores,
           dependent: :destroy

  has_many :users,
           through: :scores

  validates :status,
            presence: true,
            inclusion: { in: STATUSES }
end

# == Schema Information
#
# Table name: games
#
#  id         :uuid             not null, primary key
#  end_date   :datetime
#  start_date :datetime
#  status     :string           default("waiting"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
