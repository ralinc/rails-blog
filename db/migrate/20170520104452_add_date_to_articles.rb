class AddDateToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :date, :datetime, null: false, default: -> { 'now()' }
  end
end
