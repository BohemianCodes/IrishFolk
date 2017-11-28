class Video < ApplicationRecord

  belongs_to :user

  before_create :set_video

  def set_video
    youtube = Yt::Video.new url: url
    self.uid = youtube.id
    self.title = youtube.title

  rescue Yt::Errors::NoItems
   self.title = ''

  end

end
