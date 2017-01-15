class Article < ActiveRecord::Base
  default_scope { order(created_at: :desc) }

  enum status: [:wip, :published]

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true,
                   uniqueness: { case_sensitive: false },
                   slug: true

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
