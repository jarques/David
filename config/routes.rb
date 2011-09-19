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