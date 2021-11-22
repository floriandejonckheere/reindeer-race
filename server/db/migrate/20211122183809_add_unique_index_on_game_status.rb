# frozen_string_literal: true

class AddUniqueIndexOnGameStatus < ActiveRecord::Migration[6.1]
  def change
    add_index :games, :status, unique: true, where: "status = 'ongoing'"
  end
end
