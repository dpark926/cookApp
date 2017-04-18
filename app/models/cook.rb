class Cook < ApplicationRecord
  has_many :foods

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :neighborhood, presence: true
  validates :address, presence: true
  validates :description, presence: true
end
