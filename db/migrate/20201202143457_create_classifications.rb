class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.string :name, null:false
      t.integer :group_id, null:false

      t.timestamps
    end
  end
end
