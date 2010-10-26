module Yourls
  def self.new(host, api_key, options = {})
    Yourls::Client.new(host, api_key, options)
  end
end

class YourlsError < StandardError
  attr_reader :code
  alias :msg :message
  def initialize(msg, code)
    @code = code
    super("#{msg} - '#{code}'")
  end
end
