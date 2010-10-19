module Yourls
  def self.new(host, api_key)
    Yourls::Client.new(host, api_key)
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
