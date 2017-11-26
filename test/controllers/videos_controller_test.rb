require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @video = Video.create!(title: "Irish Trad", url: "https://www.youtube.com/watch?v=7tVen9_m_2Y")
  end

  test "show index video page" do
    get videos_path
    assert_template 'videos/index'
  end

  test "show list of videos" do
    get videos_path
    assert_select "a[href=?]", video_path(@video), text: @video.title
  end

  test "create new video entry" do
    get new_video_path
    assert_template 'videos/new'
    title_of_video = "Trad Music"
    url_of_video = "https://www.youtube.com/watch?v=Sc8CjDkpb30"
    assert_difference 'Video.count', 1 do
      post videos_path, params: { video: { title: title_of_video, url: url_of_video}}
    end
    follow_redirect!
    assert_match title_of_video, response.body
    assert_match url_of_video, response.body
  end
end
