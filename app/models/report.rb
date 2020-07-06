class Report < ApplicationRecord
  EVALUATION = ['positive', 'negative', 'neutral']

  belongs_to :user
  belongs_to :officer
  belongs_to :city
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags

  validates :city, presence: true
  validates :content, presence: true
  validates :evaluation, inclusion: { in: EVALUATION }
end
