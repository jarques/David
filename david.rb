#!/usr/bin/env ruby
$:<< '../lib' << 'lib'

require 'goliath'
require 'goliath/rack/templates'

class David < Goliath::API
  
  def response (env)
    if params[:id]
      [200, {}, "Will redirect to: #{params[:id]}"]
    else
      [404, {}, "Not found"]
    end
  end
    
end

class NewURL < Goliath::API
  include Goliath::Rack::Templates

  def response (env)
    [200, {}, haml(:new_url)]
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