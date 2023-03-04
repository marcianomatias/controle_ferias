require "test_helper"

class ColaboradorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colaborador = colaboradors(:one)
  end

  test "should get index" do
    get colaboradors_url
    assert_response :success
  end

  test "should get new" do
    get new_colaborador_url
    assert_response :success
  end

  test "should create colaborador" do
    assert_difference("Colaborador.count") do
      post colaboradors_url, params: { colaborador: { cargo: @colaborador.cargo, data_contratacao: @colaborador.data_contratacao, nome: @colaborador.nome } }
    end

    assert_redirected_to colaborador_url(Colaborador.last)
  end

  test "should show colaborador" do
    get colaborador_url(@colaborador)
    assert_response :success
  end

  test "should get edit" do
    get edit_colaborador_url(@colaborador)
    assert_response :success
  end

  test "should update colaborador" do
    patch colaborador_url(@colaborador), params: { colaborador: { cargo: @colaborador.cargo, data_contratacao: @colaborador.data_contratacao, nome: @colaborador.nome } }
    assert_redirected_to colaborador_url(@colaborador)
  end

  test "should destroy colaborador" do
    assert_difference("Colaborador.count", -1) do
      delete colaborador_url(@colaborador)
    end

    assert_redirected_to colaboradors_url
  end
end
