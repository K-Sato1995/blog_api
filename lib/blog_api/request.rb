module BlogApi
  class Request
    require 'httparty'
    require 'json'

    BASE_URL = 'https://k-blog0130.herokuapp.com/api/v2/'

    def self.get(path, options={format: :plain})
      url = "#{BASE_URL}/#{path}"
      HTTParty.get(url, options)
    end
  end
end
