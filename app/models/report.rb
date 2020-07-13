class Report < ApplicationRecord
  EVALUATION = ['positive', 'negative', 'neutral']
  belongs_to :user
  belongs_to :officer, optional: true
  belongs_to :city
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags
  has_many :report_votes

  validates :city, presence: true
  validates :content, presence: true
  validates :evaluation, inclusion: { in: EVALUATION }

  include PgSearch::Model

  pg_search_scope :search_by_tag,
    associated_against: { tags: :name },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
