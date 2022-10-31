class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.references :developer, null: false, foreign_key: true
      t.text :about

      t.timestamps
    end
  end
end
