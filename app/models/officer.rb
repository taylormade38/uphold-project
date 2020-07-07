class Officer < ApplicationRecord
  belongs_to :city
  has_many :reports

  validates :name, presence: true
  validates :badge_number, presence: true
  validates :department, presence: true
end
