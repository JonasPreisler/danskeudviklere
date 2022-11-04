class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      t.integer :participant_ids, array: true, null: false

      t.timestamps
    end
  end
end
