class Marvel
  include HTTParty
  base_uri 'gateway.marvel.com:80'

  def self.character(id)
    response = self.get("/v1/public/characters/#{id}?ts=#{MarvelParameters.timestamp}&apikey=#{MarvelParameters.public_key}&hash=#{MarvelParameters.digest}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results'][0]    
  end

  def self.all_characters
    response = self.get("/v1/public/characters?ts=#{MarvelParameters.timestamp}&apikey=#{MarvelParameters.public_key}&hash=#{MarvelParameters.digest}")
    response_body = JSON.parse(response.body)
    results = response_body['data']['results']
  end
end
