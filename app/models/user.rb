class User < ActiveRecord::Base
    before_save { self.email = email.downcase }                 # makes sure nAmE@EmAIl.CoM is the same as name@email.com
    validates :name,  presence: true, length: { maximum: 50 }   # Validates precense of a username, with max length
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i    # format of the email in regular
    validates :email, presence: true, length: { maximum: 255 }, # Validates precense of a email, with max length
        format: { with: VALID_EMAIL_REGEX},                     # Validates format of email
        uniqueness: { case_sensitive: false}                    # Valiadates the uniqueness of an email, only at model level (not database level)

    has_secure_password
     validates :password, presence: true, length: { minimum: 6 } # Validates precese of a passowrd, and minimum length
end
