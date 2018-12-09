require 'httparty'
require 'json'

class RandomPostcodes
  include HTTParty

  base_uri 'https://api.postcodes.io'

  def get_random_postcode
    json = JSON.parse(self.class.get("/random/postcodes/").body)
    return json['result']['postcode']
  end

  def get_random_postcodes(quantity)
    postcodes_array = []
    for i in 0..(quantity - 1)
      json = JSON.parse(self.class.get("/random/postcodes/").body)
      postcodes_array << json['result']['postcode'].delete(' ')
    end
    return postcodes_array
  end

end
