# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :taps, presence: true
  validates :colour, presence: true
end

# == Schema Information
#
# Table name: scores
#
#  id         :uuid             not null, primary key
#  colour     :string           not null
#  score      :integer
#  taps       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  games_id   :uuid             not null
#  users_id   :uuid             not null
#
# Indexes
#
#  index_scores_on_games_id  (games_id)
#  index_scores_on_users_id  (users_id)
#
# Foreign Keys
#
#  fk_rails_...  (games_id => games.id) ON DELETE => cascade
#  fk_rails_...  (users_id => users.id) ON DELETE => cascade
#
