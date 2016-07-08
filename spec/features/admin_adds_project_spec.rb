require 'rails_helper'

describe 'Admin adds project' do
  scenario 'from dashboard' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    click_link "Proyectos"
    click_link "Nuevo Proyecto"
    fill_project_form_with(name: "My project", quantity: 2000.5, grant: "My grant", source: "http://my.source.url", observations: "My observations text")
    click_button "Guardar Proyecto"

    expect(page).to have_content "My project"
    expect(page).to have_content "Area 1"
    expect(page).to have_content Time.now.year.to_i
    expect(page).to have_content "El proyecto ha sido creado con éxito."
  end

  scenario 'with invalid params' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    click_link "Proyectos"
    click_link "Nuevo Proyecto"
    fill_project_form_with(observations: "My observations text")
    click_button "Guardar Proyecto"

    expect(page).not_to have_content "Registro creado con éxito."
    expect(page).to have_content "no puede estar en blanco"
  end

  def fill_project_form_with(attrs = {})
    fill_in "Nombre", with: attrs[:name]
    fill_in "Cantidad", with: attrs[:quantity]
    fill_in "Fondo", with: attrs[:grant]
    fill_in "Fuente", with: attrs[:source]
    fill_in "Observaciones", with: attrs[:observations]
  end
end
