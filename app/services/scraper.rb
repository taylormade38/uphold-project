require 'open-uri'
require 'nokogiri'


class Scraper
   def initialize
    @base_uri = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
  end

  def call(params = {})
    #does magicscraping
    #Nokogiri
    # parse the html
    # put into a nice hash
    # send it back to the controller
    city = params[:city]
    key = ENV["GOOGLE_API_SERVER_KEY"]
    query = "#{@base_uri}location=#{params[:latitude]},#{params[:longitude]}&radius=10000&keyword=mental&key=#{key}"

    html_file = open(query).read
    response = JSON.parse(html_file)
    place_ids = response["results"].map { |result| result["place_id"] }
    places = []
    place_ids.each do |id|
      query = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{id}&fields=name,formatted_phone_number,website&key=#{key}"
      html_file = open(query).read
      response = JSON.parse(html_file)
      places << response["result"]
    end
    places
  end
end
