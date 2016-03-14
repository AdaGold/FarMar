# require_relative '../far_mar'

class FarMar::Market
  FILENAME = "./support/markets.csv"
  attr_reader :id, :name, :address, :city, :county, :state, :zip

  def initialize(market_data)
    @id = market_data[:id].to_i # fixnum
    @name = market_data[:name] #string
    @address = market_data[:address] #string
    @city = market_data[:city] #string
    @county = market_data[:county] #string
    @state = market_data[:state] #string
    @zip = market_data[:zip] #string
  end

  def self.all # self is the class and all is the method
    market_array = []
    CSV.open(FILENAME, "r") do |csv|
    csv.read.each do |line|
      market_array << self.new( id: line[0], name: line[1], address: line[2], city: line[3], county: line[4], state: line[5], zip: line[6] )
    end
    end
    return market_array
  end

  def self.find(id)
    all_markets = self.all
    all_markets.each do |market|
      if market.id == id
      end
      return market #an instance 
    end
  end


end
