require_relative 'blog_api/version'
require_relative 'blog_api/client'
require_relative 'blog_api/configuration'

module BlogApi
  attr_accessor :configuration
  class << self
    def configuration
      @configuration = BlogApi::Configuration.new
    end

    def client
      BlogApi::Client.new(configuration)
    end

    def categories
      client.get('categories')
    end

    def posts
      client.get('posts')
    end

    def post(post_id)
      client.get("posts/#{post_id}")
    end

    def featured_posts
      client.get("featured_posts")
    end

    def tags
      client.get("tags")
    end
  end
end
