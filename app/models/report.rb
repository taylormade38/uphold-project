class Report < ApplicationRecord
  EVALUATION = ['positive', 'negative', 'neutral']
  belongs_to :user
  belongs_to :officer, optional: true
  belongs_to :city
  has_many :report_tags, dependent: :destroy
  has_many :tags, through: :report_tags
  has_many :report_votes
  has_many :report_bookmarks
  has_many_attached :photos
  before_validation :set_city
  # validates :city, presence: true
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

  after_create :send_resources

  private

  def send_resources
    if self.user.city
      user_city = City.find_or_create_by(name: self.user.city.name)
      places = Scraper.new.call(longitude: user_city.longitude, latitude: user_city.latitude, city: user_city)
      ResourcesMailer.with(user: self).resources(places).deliver_now!
    end
  end

  def set_city
    if address && address.split(",")[-3]
      city_name = address.split(",")[-3].strip
      city = City.find_by(name: city_name)
      self.city = city
    end
  end
end
