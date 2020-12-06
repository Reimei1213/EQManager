class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name, unique: true, null: false
      t.integer :admin, null: false

      t.timestamps
    end
  end
end
