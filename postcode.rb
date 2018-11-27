require 'httparty'
require 'json'

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

  def get_result_single
    @single['result']
  end

  def get_status_single
    @single['status']
  end

end
