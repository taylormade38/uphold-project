class City < ApplicationRecord
  has_many :reports
  has_many :officers
  has_many_attached :photos, dependent: :destroy

  validates :name, presence: true
  validates :state, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_state,
    against: [:name, :state],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
