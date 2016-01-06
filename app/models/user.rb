class User < ActiveRecord::Base
  normalize_attributes :email, :firstname, :lastname
  validates_presence_of :email, :auth_token

  after_initialize :set_auth_token

  validates :email, presence: true, uniqueness: {case_sensitive: false},
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates_uniqueness_of :auth_token

  has_many :memberships, dependent: :destroy
  has_many :games, through: :memberships

  TOKEN_LENGTH = 16

  private

  def set_auth_token
    self.auth_token ||= generate_auth_token
  end

  def generate_auth_token
    SecureRandom.hex(TOKEN_LENGTH)
  end
end
