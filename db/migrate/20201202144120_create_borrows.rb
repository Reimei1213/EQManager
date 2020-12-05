class CreateBorrows < ActiveRecord::Migration[6.0]
  def change
    create_table :borrows do |t|
      t.integer :group_user_id, null:false
      t.integer :equipment_id, null:false
      t.date :return_day

      t.timestamps
    end
  end
end
