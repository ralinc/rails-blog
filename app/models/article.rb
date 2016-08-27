class Article < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true,
                   uniqueness: true,
                   format: { with: /\A[a-z-]+\z/ }

  enum status: [:wip, :published]

  def to_param
    slug_changed? ? slug_was : slug
  end
end
