# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :status, null: false
  
      t.timestamps
    end
  end  
end
