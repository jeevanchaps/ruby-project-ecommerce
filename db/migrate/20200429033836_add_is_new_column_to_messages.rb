class AddIsNewColumnToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :is_new, :boolean
  end
end
