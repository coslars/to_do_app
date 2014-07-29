class User < ActiveRecord::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_create :create_remember_token
  before_save { self.email = email.downcase }

  validates :f_name, presence: true, length: { maximum: 75 }
  validates :l_name, presence: true, length: { maximum: 75 }
  validates :email, presence: true, length: { maximum: 100 }
  validates :email, presence:   true,
            length: { maximum: 100 },
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8, maximum: 25 }

  has_secure_password

  private

    #
    # Note: This is a class method
    #
    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end

    #
    # Note: This is a class method
    #
    def User.digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    #
    # Note: This is an instance method
    #
    def create_remember_token
      # The use of self here refers to the instance of User
      self.remember_token = User.digest(User.new_remember_token)
    end
end
