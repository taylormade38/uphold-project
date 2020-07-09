require 'open-uri'

class City < ApplicationRecord
  has_many :reports
  has_many :officers
  has_many_attached :photos, dependent: :destroy

  validates :name, presence: true
  validates :state, presence: true

    def find_photo
        api_key = ENV["GOOGLE_API_SERVER_KEY"]
        places_search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{self.name}&key=#{api_key}"
        places_search_json = JSON.parse(open(places_search_url).read)
        photo_ref = places_search_json["results"][0]["photos"][0]["photo_reference"]

        "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_ref}&key=#{api_key}"
    end
end
