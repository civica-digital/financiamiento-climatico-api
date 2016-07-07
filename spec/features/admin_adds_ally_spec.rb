require 'rails_helper'

describe 'Admin adds ally user' do
  scenario 'from dashboard' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    click_link "Aliados"
    click_link "Nuevo Aliado"
    fill_ally_form_with(name: "My ally user", contact: "ally@mail.com")
    click_button "Guardar Aliado"

    expect(page).to have_content "My ally user"
    expect(page).to have_content "ally@mail.com"
    expect(page).to have_content "El usuario Aliado ha sido creado con éxito."
  end

  scenario 'with invalid params' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    click_link "Aliados"
    click_link "Nuevo Aliado"
    fill_ally_form_with(contact: "ally@mail.com")
    click_button "Guardar Aliado"

    expect(page).not_to have_content "El usuario Aliado ha sido creado con éxito."
    expect(page).to have_content "no puede estar en blanco"
  end

  def fill_ally_form_with(attrs = {})
    fill_in "Nombre", with: attrs[:name]
    fill_in "Contacto", with: attrs[:contact]
  end
end
