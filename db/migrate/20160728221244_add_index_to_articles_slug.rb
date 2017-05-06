class AddIndexToArticlesSlug < ActiveRecord::Migration[5.0]
  def change
    add_index :articles, :slug
  end
end
