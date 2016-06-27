require 'rails_helper'

describe 'Admin sees dashboard' do
  scenario 'after login' do
    admin = create :user, :admin

    login_as admin
    visit "/admin"

    expect(page).to have_link "Organizaciones"
    expect(page).to have_link "Proyectos"
    expect(page).to have_link "Cerrar sesión"
    expect(current_path).to eq admin_root_path
  end
end
