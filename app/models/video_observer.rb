class VideoObserver < ActiveRecord::Observer
  def before_save(resource)
    video = Yt::Video.new url: resource.url
    resource.uid = video.id
    resource.title = video.title

  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end
