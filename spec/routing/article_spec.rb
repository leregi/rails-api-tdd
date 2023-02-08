require 'rails_helper'

RSpec.describe '/articles routes' do
    it 'routes to articles#index' do
        aggregate_failures do
            # expect(get '/articles').to route_to(controller: 'articles, action: index')
            expect(get '/articles').to route_to('articles#index')
            # dynamically test the route
            # expect(get '/articles?page[number]=3').to route_to('articles#index', page: { number: 3 })
            # expect(get '/articles/:id[number]=1').to route_to('articles#show', id: { number: 1 })
        end
    end
end