require 'test_helper'

class UseOfCfdisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @use_of_cfdi = use_of_cfdis(:one)
  end

  test "should get index" do
    get use_of_cfdis_url
    assert_response :success
  end

  test "should get new" do
    get new_use_of_cfdi_url
    assert_response :success
  end

  test "should create use_of_cfdi" do
    assert_difference('UseOfCfdi.count') do
      post use_of_cfdis_url, params: { use_of_cfdi: { cfdi_key: @use_of_cfdi.cfdi_key, descripcion: @use_of_cfdi.descripcion, persona_fisica: @use_of_cfdi.persona_fisica, persona_moral: @use_of_cfdi.persona_moral } }
    end

    assert_redirected_to use_of_cfdi_url(UseOfCfdi.last)
  end

  test "should show use_of_cfdi" do
    get use_of_cfdi_url(@use_of_cfdi)
    assert_response :success
  end

  test "should get edit" do
    get edit_use_of_cfdi_url(@use_of_cfdi)
    assert_response :success
  end

  test "should update use_of_cfdi" do
    patch use_of_cfdi_url(@use_of_cfdi), params: { use_of_cfdi: { cfdi_key: @use_of_cfdi.cfdi_key, descripcion: @use_of_cfdi.descripcion, persona_fisica: @use_of_cfdi.persona_fisica, persona_moral: @use_of_cfdi.persona_moral } }
    assert_redirected_to use_of_cfdi_url(@use_of_cfdi)
  end

  test "should destroy use_of_cfdi" do
    assert_difference('UseOfCfdi.count', -1) do
      delete use_of_cfdi_url(@use_of_cfdi)
    end

    assert_redirected_to use_of_cfdis_url
  end
end
