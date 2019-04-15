class RolesUser < ApplicationRecord
  belongs_to :role
  belongs_to :user
  validates :user, presence: true
  validates :role, presence: true, uniqueness: { scope: :user }
end
