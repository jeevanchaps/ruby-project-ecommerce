class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.string :sender
      t.string :recipient

      t.timestamps
    end
  end
end
