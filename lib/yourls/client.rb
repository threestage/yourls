require 'digest/md5'

module Yourls
  class Client
    include HTTParty

    def initialize(host, api_key, options = {})
      @host, @api_key = host, api_key
      @base_uri = File.join(host, 'yourls-api.php')
      @server_offset = options[:offset] || 0.to_i
    end

    def stats(options = {})
      response = get('stats', options)
      response.parsed_response
    end

    def expand(short_url, options = {})
      Yourls::Url.new(get('expand', options.merge!(:shorturl => short_url)).parsed_response)
    end

    def shorten(long_url, options = {})
      Yourls::Url.new(get('shorturl', options.merge!(:url => long_url)).parsed_response)
    end

    def get(action, query = {})
      # Prepare the signature
      timestamp = (Time.now + @server_offset).to_i
      signature = Digest::MD5.hexdigest(timestamp.to_s + @api_key)

      query ||= {}
      query.merge!(:timestamp => timestamp, :signature => signature, :action => action, :format => 'json') 

      response = self.class.get(@base_uri, :query => query)

      if response.code == 200
        return response
      else
        raise YourlsError.new(response.message, response.code)
      end
    end
  end
end
