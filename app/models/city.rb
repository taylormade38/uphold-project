class City < ApplicationRecord
  has_many :reports
  has_many :officers
end
