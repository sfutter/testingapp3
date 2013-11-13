class CreateWires < ActiveRecord::Migration
  def change
    create_table :wires do |t|
      t.string :title
      t.string :frequency
      t.integer :user_id

      t.timestamps
    end
  end
end
