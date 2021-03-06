class Group < ApplicationRecord
  has_many :groups_users
  has_many :users, through: :groups_users
  validates :name, presence: true, uniqueness: true
  has_many :posts, dependent: :delete_all
end
