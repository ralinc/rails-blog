class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :password, presence: true, length: { minimum: 6, maximum: 20 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 255 },
                    email: true

  before_save { email.try(:downcase!) }

  has_secure_password
end
