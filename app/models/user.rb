class User < ActiveRecord::Base
  attr_accessor   :password
  attr_accessible :name, :email, :password, :password_confirmation

  EMAIL_REGEX = /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/

  validates :name, :presence => true, :length => { :maximum => 50}

  validates :email, :presence => true,
                    :format => { :with => EMAIL_REGEX},
                    :uniqueness => {:case_sensitive => false}
  validates :password, :presence =>true,
                       :confirmation => true,
                       :length => { :within => 6..40 }

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  class << self
    def authenticate(email, submitted_passsword)
      user = find_by_email
      return nil if user.nil?
      return user ifuser.has_password?(submitted_password)
    end
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password  = encrypt(password)
  end

  def encrypt(string)
   secure_hash("#{salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end




