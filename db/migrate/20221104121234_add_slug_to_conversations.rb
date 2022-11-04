class AddSlugToConversations < ActiveRecord::Migration[7.0]
  def change
    add_column :conversations, :slug, :string, null: false
  end
end
