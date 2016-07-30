class Article < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true,
                   uniqueness: true,
                   format: { with: /\A[0-9a-z-]+\z/ }

  def to_param
    "#{id}-#{slug}"
  end
end
