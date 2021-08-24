require "test_helper"

class RecruitersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recruiter = recruiters(:one)
  end

  test "should get index" do
    get recruiters_url, as: :json
    assert_response :success
  end

  test "should create recruiter" do
    assert_difference('Recruiter.count') do
      post recruiters_url, params: { recruiter: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show recruiter" do
    get recruiter_url(@recruiter), as: :json
    assert_response :success
  end

  test "should update recruiter" do
    patch recruiter_url(@recruiter), params: { recruiter: {  } }, as: :json
    assert_response 200
  end

  test "should destroy recruiter" do
    assert_difference('Recruiter.count', -1) do
      delete recruiter_url(@recruiter), as: :json
    end

    assert_response 204
  end
end
