class AddNullFalseToBusinessesName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :businesses, :name, false
  end
end
