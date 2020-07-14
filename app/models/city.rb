require 'open-uri'

class City < ApplicationRecord
  has_many :reports
  has_many :officers
  has_many_attached :photos, dependent: :destroy

  geocoded_by :name
  after_validation :geocode, if: :will_save_change_to_name?

  validates :name, presence: true
  validates :state, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_state,
    against: [:name, :state],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

   def find_photo
    begin
        api_key = ENV["GOOGLE_API_SERVER_KEY"]
        places_search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{self.name}&key=#{api_key}"
        places_search_json = JSON.parse(open(places_search_url).read)
        photo_ref = places_search_json["results"][0]["photos"][0]["photo_reference"]
        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_ref}&key=#{api_key}"
      rescue
        "https://media-exp1.licdn.com/dms/image/C4D1BAQGxdaugFoixFg/company-background_10000/0?e=1594371600&v=beta&t=gtqeCMm_2mpO0BgakEGqexDZBbvXexqDw41MYsvT618"
      end
    end

    def self.city_name
        City.all.map { |city| city.name }
    end

    def use_of_force
        (self.use_of_force_unarmed.to_f / self.use_of_force_incidents) * 100
    end

end
