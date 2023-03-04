require "application_system_test_case"

class ColaboradorsTest < ApplicationSystemTestCase
  setup do
    @colaborador = colaboradors(:one)
  end

  test "visiting the index" do
    visit colaboradors_url
    assert_selector "h1", text: "Colaboradors"
  end

  test "should create colaborador" do
    visit colaboradors_url
    click_on "New colaborador"

    fill_in "Cargo", with: @colaborador.cargo
    fill_in "Data contratacao", with: @colaborador.data_contratacao
    fill_in "Nome", with: @colaborador.nome
    click_on "Create Colaborador"

    assert_text "Colaborador was successfully created"
    click_on "Back"
  end

  test "should update Colaborador" do
    visit colaborador_url(@colaborador)
    click_on "Edit this colaborador", match: :first

    fill_in "Cargo", with: @colaborador.cargo
    fill_in "Data contratacao", with: @colaborador.data_contratacao
    fill_in "Nome", with: @colaborador.nome
    click_on "Update Colaborador"

    assert_text "Colaborador was successfully updated"
    click_on "Back"
  end

  test "should destroy Colaborador" do
    visit colaborador_url(@colaborador)
    click_on "Destroy this colaborador", match: :first

    assert_text "Colaborador was successfully destroyed"
  end
end
