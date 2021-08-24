require "test_helper"

class JobSeekersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_seeker = job_seekers(:one)
  end

  test "should get index" do
    get job_seekers_url, as: :json
    assert_response :success
  end

  test "should create job_seeker" do
    assert_difference('JobSeeker.count') do
      post job_seekers_url, params: { job_seeker: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show job_seeker" do
    get job_seeker_url(@job_seeker), as: :json
    assert_response :success
  end

  test "should update job_seeker" do
    patch job_seeker_url(@job_seeker), params: { job_seeker: {  } }, as: :json
    assert_response 200
  end

  test "should destroy job_seeker" do
    assert_difference('JobSeeker.count', -1) do
      delete job_seeker_url(@job_seeker), as: :json
    end

    assert_response 204
  end
end
