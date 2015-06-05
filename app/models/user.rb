class User < ActiveRecord::Base
  has_many :comments

  has_secure_password

  before_create :set_token
  after_find :fix_up_token

  validates :username, uniqueness: true

  def logout
    new_token
  end

  def authenticate_with_new_token(password)
    authenticate_without_new_token(password) && new_token
  end

  alias_method_chain :authenticate, :new_token

  private

  # FIXME: Validate that token doesn't exist? (improbable)
  def set_token
    self.token = SecureRandom.hex(16)
  end

  # unconditionally create and set a new token
  def new_token
    update_columns(token: set_token)
  end

  # expire old token
  def fix_up_token
    # FIXME: token age should be configurable
    new_token if updated_at < 1.day.ago
  end
end
