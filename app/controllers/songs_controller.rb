class SongsController < ApplicationController

# static routes
    # index route
    get '/songs' do
        @songs = Song.all
        erb :"/songs/index"
    end

    # new route
    get '/songs/new' do
        erb :"/songs/new"
    end

    # create route
    post '/songs' do
        if Artist.find_by_name(params[:song][:artist_name])
            @song = Song.create(params[:song], artist: Artist.find_by_name(params[:song][:artist_name]))
        else
            @new_artist = Artist.create(name: params[:artist_name])
            @song = Song.create(params[:song], @new_artist)
        end

        redirect "/songs/#{@song.slug}"
    end

# dynamic routes
    # show route
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"/songs/show"
    end

end