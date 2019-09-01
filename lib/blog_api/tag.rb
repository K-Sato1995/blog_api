module BlogApi
  class Tag
    def self.all
      BlogApi::Request.get('tags')
    end
  end
end
