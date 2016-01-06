class Game < ActiveRecord::Base
  normalize_attributes :name, :description
  validates_presence_of :name, :description
  validates_uniqueness_of :name, case_sensitive: false
  belongs_to :user
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, class_name: 'User', foreign_key: 'user_id', source: :user

  after_create :make_owner_a_member

  def make_owner_a_member
    Membership.create(game: self, user: self.user)
  end
end
