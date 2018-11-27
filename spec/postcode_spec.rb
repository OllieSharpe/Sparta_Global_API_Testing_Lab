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
      expect(@response.search_single_result_for('postcode').delete(' ').length).to be_between(5,7).inclusive
    end

    it "should return an quality key integer between 1-9" do
      expect(@response.search_single_result_for('quality')).to be_between(1, 9).inclusive
    end

    it "should return an ordnance survey eastings value as integer" do
      expect(@response.search_single_result_for('eastings')).to be_kind_of(Integer)
    end

    it "should return an ordnance survey northings value as integer" do
      expect(@response.search_single_result_for('northings')).to be_kind_of(Integer)
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      expect(@response.search_single_result_for('country').downcase).to eq("england").or eq("northern ireland").or eq("scotland").or eq("wales")
    end

    it "should return a string value for NHS authority " do
      expect(@response.search_single_result_for('nhs_ha')).to be_kind_of(String)
    end

    it "should return a longitude float value" do
      expect(@response.search_single_result_for('longitude')).to be_kind_of(Float)
    end

    it "should return a latitude float value" do
      expect(@response.search_single_result_for('latitude')).to be_kind_of(Float)
    end

    it "should return a parliamentary constituency string" do
      expect(@response.search_single_result_for('parliamentary_constituency')).to be_kind_of(String)
    end

    it "should return a european_electoral_region string" do
      expect(@response.search_single_result_for('european_electoral_region')).to be_kind_of(String)
    end

    it "should return a primary_care_trust string" do
      expect(@response.search_single_result_for('primary_care_trust')).to be_kind_of(String)
    end

    it "should return a region string" do
      expect(@response.search_single_result_for('region')).to be_kind_of(String).or be_nil
    end

    it "should return a parish string" do
      expect(@response.search_single_result_for('parish')).to be_kind_of(String).or be_nil
    end

    it "should return a lsoa string" do
      expect(@response.search_single_result_for('lsoa')).to be_kind_of(String)
    end

    it "should return a msoa string" do
      expect(@response.search_single_result_for('msoa')).to be_kind_of(String).or be_nil
    end
    # admin ward and county are not documented however tested below

    it "should return an admin_district string" do
      expect(@response.search_single_result_for('admin_district')).to be_kind_of(String)
    end

    it "should return a incode string of three characters" do
      expect(@response.search_single_result_for('incode').length).to eq 3
    end

    it "should return an outcode string of 3-4 characters" do
      expect(@response.search_single_result_for('outcode').length).to be_between(2, 4)
    end
  end

  context "multiple postcodes validation" do

    before(:all) do
      @postcode = RandomPostcodes.new
      @postcodesio = Postcodesio.new
      @postcode_array = @postcode.get_random_postcodes(3)
      @postcodesio.get_multiple_postcodes(@postcode_array) #Add in array of postcodes
      @response = @postcodesio
    end

    it "should respond with a status message of 200" do
      expect(@response.get_status(@response.multiple).to_i).to eq 200
    end

    it "should return the first query as the first postcode in the response" do
      for i in 0..(@response.multiple.length - 1) do
        expect(@response.get_postcodes_multiple(i).downcase.delete(' ')).to eq(@postcode_array[i].downcase)
      end
    end

    it "should have a results hash" do
      for i in 0..(@response.multiple.length - 1) do
        expect(@response.get_results_multiple(i)).to be_kind_of(Hash)
      end
    end

    it "should return a postcode between 5-7 in length"  do
      @response.search_multiple_results_for('postcode').each do |item|
        expect(item.delete(' ').length).to be_between(5, 7).inclusive
      end
    end

    it "should return a quality key integer between 1-9" do
      @response.search_multiple_results_for('quality').each do |item|
        expect(item).to be_between(1, 9).inclusive
      end
    end

    it "should return an ordnance survey eastings value as integer" do
      @response.search_multiple_results_for('eastings').each do |item|
        expect(item).to be_kind_of(Integer)
      end
    end

    it "should return an ordnance survey northings value as integer" do
      @response.search_multiple_results_for('northings').each do |item|
        expect(item).to be_kind_of(Integer)
      end
    end

    it "should return a country which is one of the four constituent countries of the UK" do
      @response.search_multiple_results_for('country').each do |item|
        expect(item.downcase).to eq("england").or eq("northern ireland").or eq("scotland").or eq("wales")
      end
    end

    it "should return a string value for NHS authority " do
      @response.search_multiple_results_for('nhs_ha').each do |item|
        expect(item).to be_kind_of(String)
      end
    end

    it "should return a longitude float value" do
      @response.search_multiple_results_for('longitude').each do |item|
        expect(item).to be_kind_of(Float)
      end
    end

    it "should return a latitude float value" do
      @response.search_multiple_results_for('latitude').each do |item|
        expect(item).to be_kind_of(Float)
      end
    end

    it "should return a parliamentary constituency string" do
      @response.search_multiple_results_for('parliamentary_constituency').each do |item|
        expect(item).to be_kind_of(String)
      end
    end

    it "should return a european_electoral_region string" do
      @response.search_multiple_results_for('european_electoral_region').each do |item|
        expect(item).to be_kind_of(String)
      end
    end

    it "should return a primary_care_trust string" do
      @response.search_multiple_results_for('primary_care_trust').each do |item|
        expect(item).to be_kind_of(String)
      end
    end

    it "should return a region string" do
      @response.search_multiple_results_for('region').each do |item|
        expect(item).to be_kind_of(String).or be_nil
      end
    end

    it "should return a parish string" do
      @response.search_multiple_results_for('parish').each do |item|
        expect(item).to be_kind_of(String).or be_nil
      end
    end

    it "should return a lsoa string" do
      @response.search_multiple_results_for('lsoa').each do |item|
        expect(item).to be_kind_of(String)
      end
    end

    it "should return a msoa string" do
      @response.search_multiple_results_for('msoa').each do |item|
        expect(item).to be_kind_of(String).or be_nil
      end
    end
    # admin ward and county are not documented however tested below

    it "should return an admin_district string" do
      @response.search_multiple_results_for('admin_district').each do |item|
        expect(item).to be_kind_of(String)
      end
    end

    it "should return a incode string of three characters" do
      @response.search_multiple_results_for('incode').each do |item|
        expect(item.length).to eq 3
      end
    end

    it "should return an outcode string of 3-4 characters" do
      @response.search_multiple_results_for('outcode').each do |item|
        expect(item.length).to be_between(2, 4).inclusive
      end
    end

  end

end
