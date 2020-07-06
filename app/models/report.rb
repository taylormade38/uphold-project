class Report < ApplicationRecord
  belongs_to :user
  belongs_to :officer
  belongs_to :city
end
