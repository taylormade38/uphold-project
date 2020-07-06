class Officer < ApplicationRecord
  belongs_to :city
  has_many :reports
end
