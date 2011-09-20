require 'rubygems'
require 'goliath'
require 'goliath/rack/templates'

require 'redis'
require 'net/http'
require "uri"

class David < Goliath::API

  def response (env)
    if params[:id]
      fetch(params[:id])
    else
      [200, {}, "Set"]
    end
  end

  def fetch (id)
    redis = Redis.new
    url = redis.get id
    if url
      [301, {"Content-Type" => "text/html"}, "<script type='text/javascript'>window.location = \"#{url}\"</script>"]
    else
      [404, {}, "URL not found. Sorry."]
    end
  end

end

class NewURL < Goliath::API
  include Goliath::Rack::Templates

  def response (env)
    [200, {"Content-Type" => "text/html"}, haml(:new_url)]
  end
end

class RackRoutes < Goliath::API

  map '/new' do
    run NewURL.new
  end

  map '/:id' do
    run David.new
  end

end
