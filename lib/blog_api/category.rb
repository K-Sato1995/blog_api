module BlogApi
  class Category
    def self.all
      BlogApi::Request.get('/categories')
    end
  end
end
