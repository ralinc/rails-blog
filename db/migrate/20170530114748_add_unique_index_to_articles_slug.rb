class AddUniqueIndexToArticlesSlug < ActiveRecord::Migration[5.1]
  def change
    remove_index :articles, name: 'index_articles_on_slug'
    add_index :articles, :slug, unique: true
  end
end
