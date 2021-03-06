class AlbumsController < ApplicationController

  def new
    @bands = Band.all
    @selected = Band.find_by(id: flash[:id])
    render :new
  end

  def create
    album = Album.new(album_params)
    if album.save
      band = Band.find_by(id: album_params[:band_id])
      redirect_to band_url(band)
    else
      flash.now[:errors] = album.errors.full_messages
      @bands = Band.all
      @selected = Band.find_by(id: album_params[:id])
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    album = Album.find_by(id: params[:id])
    if album.update(album_params)
      redirect_to band_url(album_params[:band_id])
    else
      flash.now[:errors] = album.errors.full_messages
      render :edit
    end
  end

  def destroy
    album = Album.find_by(id: params[:id])
    band = album.band
    album.destroy
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end
end
