require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "get and show homepage" do
    get root_path
    assert_template 'pages/home'
    
  end

end
