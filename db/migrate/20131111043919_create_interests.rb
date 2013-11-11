class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :topic
      t.references :wire, index: true

      t.timestamps
    end
  end
end
