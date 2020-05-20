class SongsController < ApplicationController 
    before_action :current_song, only: [:show, :update, :edit, :destroy]

    def index 
        @songs=Song.all 
    end 

    def new 
        @song=Song.new
    end 

    def show 
    end 

    def create
        @song = Song.new(songs_params)
        if @song.save
          redirect_to @song
        else
          render :new
        end
      end
    
      def update
        if @song.update(songs_params)
          redirect_to @song
        else
          render :edit
        end
      end

    def edit 
    end 

    def destroy 
        @song.destroy
        redirect_to "/songs"
    end 

    def current_song
        @song=Song.find(params[:id])
    end 

    private 

    def songs_params 
        params.require(:song).permit!
    end 

end 