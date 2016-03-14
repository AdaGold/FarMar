require_relative './spec_helper'
require_relative '../far_mar'
#require_relative '../sale'


describe FarMar::Sale do

  # before do
  #   #@our_tile_bag = Scrabble::Tilebag.new
  # end

  it "it creates a new Sale instance" do
  FarMar::Sale.wont_be_nil
  end
end
