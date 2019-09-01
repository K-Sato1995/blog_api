module BlogApi
  class Request
    require 'httparty'
    require 'json'

    BASE_URL = 'https://k-blog0130.herokuapp.com/api/v2/'.freeze

    class << self
      def get(path, options: { format: :plain })
        url = "#{BASE_URL}/#{path}"
        response = HTTParty.get(url, options)
        json_parse(response)
      end

      private

      def json_parse(response, options: { symbolize_names: true })
        JSON.parse(response, options)
      end
    end
  end
end
