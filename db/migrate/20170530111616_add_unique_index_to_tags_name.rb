class AddUniqueIndexToTagsName < ActiveRecord::Migration[5.1]
  def change
    remove_index :tags, name: 'index_tags_on_name'
    add_index :tags, :name, unique: true
  end
end
