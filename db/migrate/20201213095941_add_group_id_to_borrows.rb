class AddGroupIdToBorrows < ActiveRecord::Migration[6.0]
  def change
    add_column :borrows, :group_id, :integer
  end
end
