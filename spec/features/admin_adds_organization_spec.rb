require 'rails_helper'

describe 'Admin adds organization' do
  scenario 'from dashboard' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    click_link "Organizaciones"
    click_link "Nueva organización"
    fill_organization_form_with(name: "My organization", contact: "org@mail.com")
    click_button "Guardar Organización"

    expect(page).to have_content "My organization"
    expect(page).to have_content "org@mail.com"
    expect(page).to have_content "La organización ha sido creada con éxito."
  end

  scenario 'with invalid params' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    click_link "Organizaciones"
    click_link "Nueva organización"
    fill_organization_form_with(contact: "org@mail.com")
    click_button "Guardar Organización"

    expect(page).not_to have_content "La organización ha sido creada con éxito."
    expect(page).to have_content "no puede estar en blanco"
  end

  def fill_organization_form_with(attrs = {})
    fill_in "Nombre", with: attrs[:name]
    fill_in "Contacto", with: attrs[:contact]
  end
end
