class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings

  def published_articles
    @published_articles ||= articles.published.decorate
  end
end
