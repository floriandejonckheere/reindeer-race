# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :colour,
            presence: true

  validates :user_id,
            uniqueness: { scope: :game_id }
end

# == Schema Information
#
# Table name: scores
#
#  id         :uuid             not null, primary key
#  colour     :string           not null
#  score      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_scores_on_game_id              (game_id)
#  index_scores_on_user_id              (user_id)
#  index_scores_on_user_id_and_game_id  (user_id,game_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (game_id => games.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#
