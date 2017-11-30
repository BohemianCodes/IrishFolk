class VideosController < ApplicationController

  before_action :authenticate_user!

  def index
    if params[:q]
      search_term = params[:q]
      @videos = Video.search(search_term)
    # return our filtered list here
    else
      @videos = Video.order('created_at DESC')
    end
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
      flash[:notice] = "Video erfolgreich hinzugefügt!"
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
