class Article < ApplicationRecord
  default_scope { order(date: :desc) }

  enum status: [:wip, :published]

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :content, presence: true
  validates :date, presence: true
  validates :slug, presence: true, slug: true, uniqueness: {case_sensitive: false}
  validates :title, presence: true

  paginates_per 5

  def to_param
    slug_changed? ? slug_was : slug
  end

  def tags_string=(string)
    self.tags = string.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def tags_string
    tags.map(&:name).join(', ')
  end
end
