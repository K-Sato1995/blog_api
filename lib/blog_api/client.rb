require 'httparty'
require_relative './response'

module BlogApi
  class Client
    class RequestError < StandardError; end
    DEFAULT_URL = 'https://k-blog0130.herokuapp.com/api/v2/'
    attr_reader :base_url

    def initialize(base_url = DEFAULT_URL)
      @base_url = base_url
    end

    def get(path, options: { format: :plain })
      url = "#{base_url}/#{path}"
      result = HTTParty.get(url, options)

      raise RequestError unless result.response.code == '200'

      BlogApi::Response.new(result)
    end
    
    def categories
      get('categories').parsed_body
    end

    def posts
      get('posts').parsed_body
    end

    def post(post_id)
      get("posts/#{post_id}").parsed_body
    end

    def featured_posts
      get("featured_posts").parsed_body
    end

    def tags
      get("tags").parsed_body
    end
  end
end
