require_relative '../lib/blog_api'

client = BlogApi::Client.new
# Get all categories
client.categories
# Get all posts
client.posts
# Get a specific post
client.post(2)
# Get all the featured_posts
client.featured_posts
# Get all tags
client.tags