require 'spec_helper'
require_relative '../lib/generating_data'

describe Postcodesio do

  context 'requesting information on a single postcode works correctly' do

    before(:all) do
      @postcode = RandomPostcodes.new
      @postcodesio = Postcodesio.new
      @postcodesio.get_single_postcode(@postcode.get_random_postcode.delete(' ')) #input a postcode
      @response = @postcodesio
    end

    it "should respond with a status message of 200" do
      expect(@response.get_status(@response.single).to_i).to eq 200
    end

    it "should have a results hash" do
      expect(@response.get_result(@response.single)).to be_kind_of(Hash)
    end

    it "should return a postcode between 5-7 in length"  do
      expect(@response.get_postcode(@response.single).delete(' ').length).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@response.get_quality(@response.single)).to be_between(1, 9).inclusive
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response.get_eastings(@response.single)).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@response.get_northings(@response.single)).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response.get_country(@response.single).downcase).to eq("england").or eq("ireland").or eq("scotland").or eq("wales")
    end

    it "should return a string value for NHS authority " do
      expect(@response.get_nhs(@response.single)).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@response.get_longitude(@response.single)).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@response.get_latitude(@response.single)).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@response.get_parlamentary_constituency(@response.single)).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@response.get_european_electoral_region(@response.single)).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@response.get_primary_care_trust(@response.single)).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@response.get_region(@response.single)).to be_kind_of(String)
    end

    it "should return a parish string" do
      expect(@response.get_parish(@response.single)).to be_kind_of(String)
    end

    it "should return a lsoa string" do
      expect(@response.get_lsoa(@response.single)).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@response.get_msoa(@response.single)).to be_kind_of(String)
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
      expect(@response.get_admin_district(@response.single)).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@response.get_incode(@response.single).length).to eq 3
    end

    it "should return a outcode string of 3-4 characters" do
      expect(@response.get_outcode(@response.single).length).to be_between(3, 4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcodesio = Postcodesio.new
      @postcodesio.get_multiple_postcodes(['TW106DF', 'HP52BN', 'S101BJ']) #Add in array of postcodes
      @response = @postcodesio
    end

    it "should respond with a status message of 200" do
      expect(@response.get_status(@response.multiple).to_i).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
    end

    it "should return the second query as the first postcode in the response" do
    end

    it "should have a results hash" do
    end

    it "should return a postcode between 5-7 in length"  do
      @response.get_postcode(@response.multiple).each do |item|
        expect(item.delete(' ').length).to be_between(5, 7).inclusive
      end
    end

    it "should return an quality key integer between 1-9" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return a country which is one of the four constituent countries of the UK" do
    end

    it "should return a string value for NHS authority " do
    end

    it "should return a longitude float value" do
    end

    it "should return a latitude float value" do
    end

    it "should return a parliamentary constituency string" do
    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a msoa string" do
    end

    it "should return a incode string of 3-4 characters" do
    end

    it "should have a results hash" do
    end

    it "should return a postcode between 5-7 in length"  do
    end

    it "should return an quality key integer between 1-9" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return an ordnance survey eastings value as integer" do
    end

    it "should return a country which is one of the four constituent countries of the UK" do
    end

    it "should return a string value for NHS authority " do
    end

    it "should return a longitude float value" do
    end

    it "should return a latitude float value" do
    end

    it "should return a parliamentary constituency string" do
    end

    it "should return a european_electoral_region string" do
    end

    it "should return a primary_care_trust string" do
    end

    it "should return a region string" do
    end

    it "should return a parish string" do
    end

    it "should return a lsoa string" do
    end

    it "should return a msoa string" do
    end
    # admin ward and county are not documented however tested below

    it "should return a admin_district string" do
    end

    it "should return a incode string of three characters" do
    end

    it "should return a msoa string" do
    end

    it "should return a incode string of 3-4 characters" do
    end

  end


end
