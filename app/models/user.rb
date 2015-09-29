class User < ActiveRecord::Base
    attr_accessor :remember_token, :activation_token
    before_save :downcase_email                                 # makes sure nAmE@EmAIl.CoM is the same as name@email.com
    before_create :create_activation_digest
    validates :name,  presence: true, length: { maximum: 50 }   # Validates precense of a username, with max length
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    # format of the email in regular
    validates :email, presence: true, length: { maximum: 255 }, # Validates precense of a email, with max length
        format: { with: VALID_EMAIL_REGEX},                     # Validates format of email
        uniqueness: { case_sensitive: false}                    # Valiadates the uniqueness of an email, only at model level (not database level)

    has_secure_password
     validates :password, presence: true, length: { minimum: 6 }, allow_nil: true # Validates precese of a passowrd, and minimum length
     
    # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
 # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
   # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  
    private

    # Converts email to all lower-case.
      def downcase_email
        self.email = email.downcase
      end

    # Creates and assigns the activation token and digest.
     def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
     end
end
