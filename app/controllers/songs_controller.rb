class SongsController < ApplicationController
  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.nil?
        redirect_to artists_path, alert: "Artist not found"
      else
        @songs = @artist.songs 
      end
    else
      @songs = Song.all 
    end
  end

  def song_params 
    params.require(:song).permit(:title, :artist_name, :artist_id)
  end
end
