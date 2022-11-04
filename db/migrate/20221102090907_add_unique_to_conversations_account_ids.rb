class AddUniqueToConversationsAccountIds < ActiveRecord::Migration[7.0]
  def change
    add_index :conversations, :participant_ids, unique: true
  end
end
