# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games, id: :uuid do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :status, null: false, default: "waiting"

      t.timestamps
    end
  end
end
