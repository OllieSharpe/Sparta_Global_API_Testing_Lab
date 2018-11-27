require 'httparty'
require 'json'
require_relative 'generating_data'

class Postcodesio
  include HTTParty

  attr_accessor :single, :multiple

  def initialize
    @single = 0
    @multiple = 0
  end

  base_uri 'https://api.postcodes.io'

  def get_single_postcode(postcode)
    @single = JSON.parse(self.class.get("/postcodes/#{postcode}").body)
  end

  def get_multiple_postcodes(postcodes_array)
    @multiple = JSON.parse(self.class.post('/postcodes', body: { "postcodes" => postcodes_array}).body)
  end

  # single

  def get_result(input)
    input['result']
  end

  def get_status(input)
    input['status']
  end

  def get_postcode(input)
    if (input['result'].length > 1)
      return [input['result'][0]['result']['postcode'], input['result'][1]['result']['postcode'], input['result'][2]['result']['postcode']]
    else
      return input['result']['postcode']
    end
  end

  def get_quality(input)
    input['result']['quality']
  end

  def get_eastings(input)
    input['result']['eastings']
  end

  def get_northings(input)
    input['result']['northings']
  end

  def get_country(input)
    input['result']['country']
  end

  def get_nhs(input)
    input['result']['nhs_ha']
  end

  def get_longitude(input)
    input['result']['longitude']
  end

  def get_latitude(input)
    input['result']['latitude']
  end

  def get_parlamentary_constituency(input)
    input['result']['parliamentary_constituency']
  end

  def get_european_electoral_region(input)
    input['result']['european_electoral_region']
  end

  def get_primary_care_trust(input)
    input['result']['primary_care_trust']
  end

  def get_region(input)
    input['result']['region']
  end

  def get_parish(input)
    input['result']['parish']
  end

  def get_lsoa(input)
    input['result']['lsoa']
  end

  def get_msoa(input)
    input['result']['msoa']
  end

  def get_admin_district(input)
    input['result']['admin_district']
  end

  def get_incode(input)
    input['result']['incode']
  end

  def get_outcode(input)
    input['result']['outcode']
  end

end
