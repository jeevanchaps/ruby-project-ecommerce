class AddIsViewableToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :is_viewable, :boolean
  end
end
