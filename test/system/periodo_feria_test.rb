require "application_system_test_case"

class PeriodoFeriaTest < ApplicationSystemTestCase
  setup do
    @periodo_ferium = periodo_feria(:one)
  end

  test "visiting the index" do
    visit periodo_feria_url
    assert_selector "h1", text: "Periodo feria"
  end

  test "should create periodo ferium" do
    visit periodo_feria_url
    click_on "New periodo ferium"

    fill_in "Colaborador", with: @periodo_ferium.colaborador_id
    fill_in "Data fim", with: @periodo_ferium.data_fim
    fill_in "Data inicio", with: @periodo_ferium.data_inicio
    click_on "Create Periodo ferium"

    assert_text "Periodo ferium was successfully created"
    click_on "Back"
  end

  test "should update Periodo ferium" do
    visit periodo_ferium_url(@periodo_ferium)
    click_on "Edit this periodo ferium", match: :first

    fill_in "Colaborador", with: @periodo_ferium.colaborador_id
    fill_in "Data fim", with: @periodo_ferium.data_fim
    fill_in "Data inicio", with: @periodo_ferium.data_inicio
    click_on "Update Periodo ferium"

    assert_text "Periodo ferium was successfully updated"
    click_on "Back"
  end

  test "should destroy Periodo ferium" do
    visit periodo_ferium_url(@periodo_ferium)
    click_on "Destroy this periodo ferium", match: :first

    assert_text "Periodo ferium was successfully destroyed"
  end
end
