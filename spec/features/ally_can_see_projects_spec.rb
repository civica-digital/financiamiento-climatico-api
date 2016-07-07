require 'rails_helper'

describe 'Ally can see projects' do
  scenario 'after login' do
    admin = create :user, :admin
    ally = create :user, :ally
    create :project, owner_id: admin.id, name: "Admin project", year: 2015
    create :project, owner_id: ally.id, name: "Ally project", year: 2017

    login_as ally
    visit "/admin"

    expect(page).to have_link "Proyectos"
    click_link "Proyectos"

    expect(page).to have_content "Ally project"
    expect(page).to have_content 2017
    expect(page).not_to have_content "Admin project"
    expect(page).not_to have_content 2015
  end
end
