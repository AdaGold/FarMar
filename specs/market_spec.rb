require_relative './spec_helper'
#require_relative '../far_mar'
#require_relative '../market'


describe FarMar::Market do

  # before do
  #   #@our_tile_bag = Scrabble::Tilebag.new
  # end

  it "it creates a new Market instance" do
  FarMar::Market.wont_be_nil
  end
end
