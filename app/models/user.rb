class User < ActiveRecord::Base
  # Remember to create a migration!
  validates_uniqueness_of :user_name
  has_secure_password
  has_many :urls

  def check_validation
    self.invalid?
  end


end
