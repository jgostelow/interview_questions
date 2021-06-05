require "rack/test"
require "rspec"

require "./app"

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }

describe "" do
  it "" do
  end
end