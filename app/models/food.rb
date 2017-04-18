class Food < ApplicationRecord
  belongs_to :cook

  validates :title, presence: true
  validates :cuisine, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validates :availability, presence: true
end
