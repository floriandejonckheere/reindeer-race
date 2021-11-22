# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores, id: :uuid do |t|
      t.references :user, null: false, type: :uuid, index: true, foreign_key: { on_delete: :cascade }
      t.references :game, null: false, type: :uuid, index: true, foreign_key: { on_delete: :cascade }

      t.string :colour, null: false
      t.integer :score, null: false, default: 0

      t.timestamps
    end
  end
end
