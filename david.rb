#!/usr/bin/env ruby
$:<< '../lib' << 'lib'

require 'goliath'
require 'goliath/rack/templates'

# class NewURL < Goliath::API
#   def response (env)
#     [200, {}, haml(:new_url)]
#   end
# end

class David < Goliath::API
  include Goliath::Rack::Templates
  
  def response (env)
    if params[:id]
      [200, {}, "Will redirect to: #{params[:id]}"]
    else
      [404, {}, "Not found"]
    end
  end
    
end

class RackRoutes < Goliath::API

  map '/new' do
    run David.NewURL.new
  end

  map '/:id' do
    run David.new
  end

end