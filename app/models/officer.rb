class Officer < ApplicationRecord
  belongs_to :city
  has_many :reports

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :badge_number, presence: true
  validates :department, presence: true
end
