class CreateScore < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :users, null: false, type: :integer, index: true, foreign_key: { on_delete: :cascade }
      t.references :games, null: false, type: :integer, index: true, foreign_key: { on_delete: :cascade }

      t.string :colour, null: false  
      t.datetime :score
      t.integer :taps, null: false
  
      t.timestamps
    end
  end
end