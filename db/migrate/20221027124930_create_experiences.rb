class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :account, null: false, foreign_key: true
      t.references :programming_language, null: false, foreign_key: true
      t.integer :duration_in_years
      t.text :about

      t.timestamps
    end
  end
end
