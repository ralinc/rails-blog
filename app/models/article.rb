class Article < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true,
                   uniqueness: { case_sensitive: false },
                   format: { with: /\A[a-z-]+\z/ }

  enum status: [:wip, :published]

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
