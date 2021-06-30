class SongsController < ApplicationController

# static routes
    # index route
    get '/songs' do
        @songs = Song.all
        erb :"/songs/index"
    end

# dynamic routes
    # show route
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"/songs/show"
    end

end