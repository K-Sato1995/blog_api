module BlogApi
  class Post
    class << self
      def all
        BlogApi::Request.get('posts')
      end

      def post(post_id)
        BlogApi::Request.get("posts/#{post_id}")
      end

      def featured
        BlogApi::Request.get('featured_posts')
      end
    end
  end
end
