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

  it "should return an array of postcodes of correct length and in correct format" do
    @data.get_random_postcodes(3).each do |postcode|
      code = UKPostcode.parse(postcode)
      expect(code.full_valid?).to be true
    end
    expect(@data.get_random_postcodes(3).length).to eq 3
    expect(@data.get_random_postcodes(10).length).to eq 10
  end

end
