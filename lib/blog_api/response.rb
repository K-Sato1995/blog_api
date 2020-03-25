require 'json'

module BlogApi
  class Response
    def initialize(result)
      @body = result.body
      @headers = result.headers
      @status = result.code
    end

    def parsed_body
      json_parse(@body)
    end

    private
    def json_parse(body, options: { symbolize_names: true })
      JSON.parse(body, options)
    end
  end
end