# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
         # :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :roles_users
  has_many :roles, through: :roles_users
  validates :email, uniqueness: { case_sensitive: false }

  def admin?
    roles.admin.first.present?
  end
end
