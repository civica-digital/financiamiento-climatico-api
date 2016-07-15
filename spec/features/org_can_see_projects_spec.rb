require 'rails_helper'

describe 'Organization can see projects' do
  scenario 'after login' do
    admin = create :user, :admin
    org = create :user, :organization
    create :project, owner_id: admin.id, name: "Admin project", year: 2015
    create :project, owner_id: org.id, name: "Org project", year: 2017

    login_as org
    visit "/admin"

    expect(page).not_to have_link "Aliados"
    expect(page).not_to have_link "Organizaciones"
    expect(page).to have_link "Proyectos"
    click_link "Proyectos"

    expect(page).to have_content "Org project"
    expect(page).to have_content 2017
    expect(page).not_to have_content "Admin project"
    expect(page).not_to have_content 2015
  end
end
