class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :name, null: false
      t.boolean :state, null: false, default: false
      t.integer :group_id, null: false
      t.integer :classification_id, null: false

      t.timestamps
    end
  end
end
