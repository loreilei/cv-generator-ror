require 'test_helper'

class CvGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cv_generator_index_url
    assert_response :success
  end

end
