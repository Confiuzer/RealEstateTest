require 'test_helper'

class PicturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @picture = pictures(:one)
  end

  test "should get index" do
    get pictures_url
    assert_response :success
  end

  test "should get new" do
    get new_picture_url
    assert_response :success
  end

  test "should not create picture with a estate association" do
    picture = Picture.new
    assert_not picture.save
  end

  #test "should create picture" do
  #  assert_difference('Picture.count') do
  #    post pictures_url, params: { picture: { estate_id: @picture.estate_id, url: @picture.url } }
  #  end
#
#  #  assert_redirected_to picture_url(Picture.last)
  #end

  test "should show picture" do
    get picture_url(@picture)
    assert_response :success
  end

  test "should get edit" do
    get edit_picture_url(@picture)
    assert_response :success
  end

  test "should update picture" do
    patch picture_url(@picture), params: { picture: { url: @picture.url } }
    assert_redirected_to picture_url(@picture)
  end

  test "should not update estate_id" do
    patch picture_url(@picture), params: { picture: { estate_id: @picture.estate_id, url: @picture.url } }
    assert_response :error
  end

  test "should destroy picture" do
    assert_difference('Picture.count', -1) do
      delete picture_url(@picture)
    end

    assert_redirected_to pictures_url
  end

  test "Invalid without estate" do
    picture = Picture.new
    assert !picture.valid?, "Estate is not being validated"
  end

end
