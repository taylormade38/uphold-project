class City < ApplicationRecord
  has_many :reports
  has_many :officers

  validates :name, presence: true
  validates :state, presence: true
end
