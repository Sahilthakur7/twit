class User < ActiveRecord::Base
    validates :name, presence: true,uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_ramains

  private

  def ensure_an_admin_remains
      if User.count.zero?
          raise "Sorry the last user cannot be deleted"
      end
  end
end
