class AddIsReportedToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :is_reported, :boolean
  end
end
