require "shopping/engine"
require "shopping/config"

module Shopping
  def self.configure
    @config ||= Shopping::Config.new
    yield @config if block_given?
    @config
  end

  def self.config
    @config
  end
end
