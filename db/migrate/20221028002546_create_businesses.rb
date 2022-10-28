class CreateBusinesses < ActiveRecord::Migration[7.0]
  def change
    create_table :businesses do |t|
      t.references :account, null: false, foreign_key: true
      t.string :logo
      t.string :website
      t.text :about
      t.string :name

      t.timestamps
    end
  end
end
