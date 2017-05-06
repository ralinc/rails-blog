class AddIndexToArticlesCreatedAt < ActiveRecord::Migration[5.0]
  def change
    add_index :articles, :created_at
  end
end
