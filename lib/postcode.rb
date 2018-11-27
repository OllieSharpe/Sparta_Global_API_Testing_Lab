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

  def search_multiple_results_for(search_word)
    results_array = []
    for i in 0..(@multiple.length - 1)
      results_array << @multiple['result'][i]['result']["#{search_word}"]
    end
    return results_array
  end

  def search_single_result_for(search_word)
    return @single['result']["#{search_word}"]
  end

  def get_result(input)
    input['result']
  end

  def get_status(input)
    input['status']
  end

end
