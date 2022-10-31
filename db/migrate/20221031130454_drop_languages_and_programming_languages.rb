class DropLanguagesAndProgrammingLanguages < ActiveRecord::Migration[7.0]
  def change
    drop_table :developers_languages
    drop_table :languages
  end
end
