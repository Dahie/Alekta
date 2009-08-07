require 'test_helper'

class ModsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mod" do
    assert_difference('Mod.count') do
      post :create, :mod => { }
    end

    assert_redirected_to mod_path(assigns(:mod))
  end

  test "should show mod" do
    get :show, :id => mods(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => mods(:one).id
    assert_response :success
  end

  test "should update mod" do
    put :update, :id => mods(:one).id, :mod => { }
    assert_redirected_to mod_path(assigns(:mod))
  end

  test "should destroy mod" do
    assert_difference('Mod.count', -1) do
      delete :destroy, :id => mods(:one).id
    end

    assert_redirected_to mods_path
  end
end
