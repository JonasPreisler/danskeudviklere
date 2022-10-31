class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.references :account, null: false, foreign_key: true
      t.text :about
      t.string :title
      t.string :profile_picture
      t.string :city
      t.string :first_name
      t.string :last_name
      t.string :website
      t.string :github
      t.string :role_types, array: true
      t.integer :search_status, default: 0
      t.boolean :allow_notifications, default: true

      t.timestamps
    end
  end
end
