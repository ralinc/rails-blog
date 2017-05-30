class AddNotNullConstraintsToArticles < ActiveRecord::Migration[5.1]
  def change
    change_column_null :articles, :title, false
    change_column_null :articles, :content, false
    change_column_null :articles, :slug, false
    change_column_null :articles, :status, false
  end
end
