class AddRoleLevelToSearches < ActiveRecord::Migration[7.0]
  def change
    add_column :searches, :role_level, :string
  end
end
