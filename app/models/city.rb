class City < ApplicationRecord
  has_many :reports
  has_many :officers
  has_many_attached :photos, dependent: :destroy

  validates :name, presence: true
  validates :state, presence: true
end
