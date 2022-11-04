class AddUniqeIndexToConversationsSlugs < ActiveRecord::Migration[7.0]
  def change
    add_index :conversations, :slug, unique: true
  end
end
