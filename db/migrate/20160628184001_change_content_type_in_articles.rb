class ChangeContentTypeInArticles < ActiveRecord::Migration
  def change
    change_column :articles, :content, :text
  end
end
