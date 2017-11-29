class VideosController < ApplicationController

  def index
    @videos = Video.order('created_at DESC')

  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      flash[:success] = "Video erfolgreich hinzugefügt!"
      redirect_to video_path(@video)
    else
      render 'new'
    end
  end

  private

  def video_params
      params.require(:video).permit(:url)
    end

end
