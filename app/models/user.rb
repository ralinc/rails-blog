class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :lockable

  validates :email, presence: true, email: true, uniqueness: {case_sensitive: false}
end
