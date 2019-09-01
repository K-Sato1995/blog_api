module BlogApi
  class Request
    class RequestError < StandardError; end
    require 'httparty'
    require 'json'

    BASE_URL = 'https://k-blog0130.herokuapp.com/api/v2/'.freeze

    class << self
      def get(path, options: { format: :plain })
        url = "#{BASE_URL}/#{path}"
        result = HTTParty.get(url, options)

        raise RequestError unless result.response.code == '200'

        json_parse(result)
      end

      private

      def json_parse(result, options: { symbolize_names: true })
        JSON.parse(result, options)
      end
    end
  end
end
