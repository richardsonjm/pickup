class Game < ActiveRecord::Base
  normalize_attributes :name, :description
  validates_presence_of :name, :description
  validates_uniqueness_of :name, case_sensitive: false
  belongs_to :user
end
