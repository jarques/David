#!/usr/bin/env ruby

require 'goliath'
require 'goliath/rack/templates'

require 'redis'

class David < Goliath::API
  
  def response (env)

    redis = Redis.new
    # If you're running redis with a different port or IP, use the following:
    # redis = Redis.new(:host => "10.0.1.1", :port => 6380) 

    if params[:id]
      url = redis.get params[:id]
      [200, {}, "Will redirect to: #{url}"]
    else
      [404, {"Content-Type" => "text/html"}, "Not found"]
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

  map '/new-url' do 
    run AddUrl.new
  end

end