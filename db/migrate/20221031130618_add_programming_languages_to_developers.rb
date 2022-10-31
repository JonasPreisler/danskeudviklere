class AddProgrammingLanguagesToDevelopers < ActiveRecord::Migration[7.0]
  def change
    add_column :developers, :programming_languages, :string, array: true, default: []
  end
end
