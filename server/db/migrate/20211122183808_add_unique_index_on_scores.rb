# frozen_string_literal: true

class AddUniqueIndexOnScores < ActiveRecord::Migration[6.1]
  def change
    add_index :scores, [:user_id, :game_id], unique: true
  end
end
