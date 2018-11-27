require 'spec_helper'
require_relative '../lib/generating_data'
require 'uk_postcode'

describe RandomPostcodes do

  before(:all) do
    @data = RandomPostcodes.new
  end

  # test utilizes the uk_postcode ruby gem which returns true if the poscode format is valid
  it "should return a poscode in valid UK format" do
    postcode = UKPostcode.parse(@data.get_random_postcode)
    expect(postcode.full_valid?).to be true
  end

end
