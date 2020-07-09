
  def find_photo(city)
    api_key = ENV["GOOGLE_API_SERVER_KEY"]

    places_search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=#{city}&key=#{api_key}"

  end



