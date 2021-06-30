class ArtistsController < ApplicationController

# static routes
    # index route
    get '/artists' do
        @artists = Artist.all
        erb :"/artists/index"
    end

# dynamic routes
    # show route
    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :"/artists/show"
    end

end