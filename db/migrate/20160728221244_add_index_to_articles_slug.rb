class AddIndexToArticlesSlug < ActiveRecord::Migration
  def change
    add_index :articles, :slug
  end
end
