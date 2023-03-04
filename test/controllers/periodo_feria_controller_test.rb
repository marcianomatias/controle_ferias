require "test_helper"

class PeriodoFeriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @periodo_ferium = periodo_feria(:one)
  end

  test "should get index" do
    get periodo_feria_url
    assert_response :success
  end

  test "should get new" do
    get new_periodo_ferium_url
    assert_response :success
  end

  test "should create periodo_ferium" do
    assert_difference("PeriodoFerium.count") do
      post periodo_feria_url, params: { periodo_ferium: { colaborador_id: @periodo_ferium.colaborador_id, data_fim: @periodo_ferium.data_fim, data_inicio: @periodo_ferium.data_inicio } }
    end

    assert_redirected_to periodo_ferium_url(PeriodoFerium.last)
  end

  test "should show periodo_ferium" do
    get periodo_ferium_url(@periodo_ferium)
    assert_response :success
  end

  test "should get edit" do
    get edit_periodo_ferium_url(@periodo_ferium)
    assert_response :success
  end

  test "should update periodo_ferium" do
    patch periodo_ferium_url(@periodo_ferium), params: { periodo_ferium: { colaborador_id: @periodo_ferium.colaborador_id, data_fim: @periodo_ferium.data_fim, data_inicio: @periodo_ferium.data_inicio } }
    assert_redirected_to periodo_ferium_url(@periodo_ferium)
  end

  test "should destroy periodo_ferium" do
    assert_difference("PeriodoFerium.count", -1) do
      delete periodo_ferium_url(@periodo_ferium)
    end

    assert_redirected_to periodo_feria_url
  end
end
