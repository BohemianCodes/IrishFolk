if Rails.env.production?

  Yt.configure do |config|
    config.api_key = ENV['YOUTUBE_API']
  end

else
  Yt.configure do |config|
    config.api_key = 'AIzaSyB9Da5pjpLqbZQuGtEXlrZp_F8A_d2D7Hk'
  end
end
