module Yourls
  class Url
    attr_reader :short_url, :long_url, :keyword

    def initialize(options = {})
      if options
        url = options['url'] || Hash.new('')
        @short_url = options['shorturl']
        @long_url = options['longurl'] || url['url']
        @keyword = options['keyword'] || url['keyword']
      end
    end
  end
end
