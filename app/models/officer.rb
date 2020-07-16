class Officer < ApplicationRecord
  belongs_to :city
  has_many :reports

  validates :first_name, presence: true
  validates :last_name, presence: true


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def group_by_cities
    hash = {}
    City.all.each do |city|
        Officer.all.each do |officer|
            if officer.city == city && hash.has_key?(officer.first_name)
                hash[officer.first_name] << city
            elsif officer.city == city
                hash[officer.first_name] = [city]
            end
        end
    end
    hash
    # Officer.all.group_by {|officer| officer.city_id}.map { |k,v| v.map {|w| w.full_name }};
    # raise
    # City.all.group_by { |city| city.officers.first&.first_name }
    # Officer.all.each { |officer| officer.city }
    # City.all.group_by{ |city| city.officers.pluck(:first_name) }
  end

  def officer_city
    self.city.name
  end

  def new_officer(attributes = {})
    new_officer = Officer.new

  end

end
