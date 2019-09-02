require 'httparty'
require 'json'
require_relative './configuration'

module BlogApi
  class Client
    class RequestError < StandardError; end
    attr_reader :configuration

    def initialize(configuration)
      @configuration = configuration
    end

    def get(path, options: { format: :plain })
      url = "#{configuration.base_url}/#{path}"
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
