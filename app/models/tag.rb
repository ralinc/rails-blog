class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :articles, through: :taggings

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def published_articles
    @published_articles ||= articles.published.decorate
  end
end
