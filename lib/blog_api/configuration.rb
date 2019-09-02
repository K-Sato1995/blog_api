module BlogApi
  class Configuration
    attr_reader :base_url
    def initialize
      @base_url = 'https://k-blog0130.herokuapp.com/api/v2/'
    end
  end
end
