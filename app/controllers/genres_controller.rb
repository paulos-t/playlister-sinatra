class GenresController < ApplicationController

# static routes
    # index route
    get '/genres' do
        @genres = Genre.all
        erb :"/genres/index"
    end

# dynamic routes
    # show route
    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        erb :"/genres/show"
    end

end