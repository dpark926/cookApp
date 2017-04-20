class Cook < ApplicationRecord
  has_many :foods
  has_many :reviews

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :neighborhood, presence: true
  validates :address, presence: true
  validates :description, presence: true

  def average_rating
    self.reviews.average(:rating)
    #sam.reviews.average(:rating)
  end

  def count_rating
    self.reviews.count(:rating)
  end
end
