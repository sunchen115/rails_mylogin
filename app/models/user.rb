class User < ActiveRecord::Base

  validates :name, presence: true, length: { in: 1..10 }, uniqueness: true
  validates :password, presence: true, length: {minimum: 1, maximum: 6 }

  def self.login(name, password)

    find_by(name: name, password: password)
  end
  def try_login
    find_user = User.login(self.name, self.password)
    if find_user.nil?
      errors.add(:base,'invalid password or username')
      return false
    else
      self.id = find_user.id
      return true
    end

  end
end