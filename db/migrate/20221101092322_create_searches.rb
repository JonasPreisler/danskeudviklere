class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :programming_languages
      t.string :city

      t.timestamps
    end
  end
end
