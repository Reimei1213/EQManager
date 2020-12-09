require 'test_helper'

class EquipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equip = equips(:one)
  end

  test "should get index" do
    get equips_url
    assert_response :success
  end

  test "should get new" do
    get new_equip_url
    assert_response :success
  end

  test "should create equip" do
    assert_difference('Equip.count') do
      post equips_url, params: { equip: { classification_id: @equip.classification_id, group_id: @equip.group_id, name: @equip.name, state: @equip.state } }
    end

    assert_redirected_to equip_url(Equip.last)
  end

  test "should show equip" do
    get equip_url(@equip)
    assert_response :success
  end

  test "should get edit" do
    get edit_equip_url(@equip)
    assert_response :success
  end

  test "should update equip" do
    patch equip_url(@equip), params: { equip: { classification_id: @equip.classification_id, group_id: @equip.group_id, name: @equip.name, state: @equip.state } }
    assert_redirected_to equip_url(@equip)
  end

  test "should destroy equip" do
    assert_difference('Equip.count', -1) do
      delete equip_url(@equip)
    end

    assert_redirected_to equips_url
  end
end
