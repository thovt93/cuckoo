class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  enum name: { admin: 'Cuckoo::Admin', customer: 'Cuckoo::Customer' }

  has_many :roles_users
  has_many :users, through: :roles_users
end
