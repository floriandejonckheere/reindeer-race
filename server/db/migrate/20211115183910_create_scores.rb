# frozen_string_literal: true

class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores, id: :uuid do |t|
      t.references :users, null: false, type: :uuid, index: true, foreign_key: { on_delete: :cascade }
      t.references :games, null: false, type: :uuid, index: true, foreign_key: { on_delete: :cascade }

      t.string :colour, null: false  
      t.datetime :score
      t.integer :taps, null: false
  
      t.timestamps
    end
  end
end
