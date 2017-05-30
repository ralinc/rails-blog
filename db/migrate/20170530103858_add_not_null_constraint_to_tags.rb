class AddNotNullConstraintToTags < ActiveRecord::Migration[5.1]
  def change
    change_column_null :tags, :name, false
  end
end
