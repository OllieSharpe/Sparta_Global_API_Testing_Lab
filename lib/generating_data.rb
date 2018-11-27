require 'httparty'
require 'json'

class RandomPostcodes
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_random_postcode
    json = JSON.parse(self.class.get("/random/postcodes/").body)
    return json['result']['postcode']
  end

end
