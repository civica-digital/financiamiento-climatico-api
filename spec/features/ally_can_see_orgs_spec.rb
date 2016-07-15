require 'rails_helper'

describe 'Ally can see orgs' do
  scenario 'after login' do
    admin = create :user, :admin
    ally = create :user, :ally
    create :user, :organization, owner_id: ally.id, name: "Ally org", email: "org@ally.com"
    create :user, :organization, owner_id: admin.id, name: "Admin org", email: "org@admin.com"

    login_as ally
    visit "/admin"

    expect(page).to have_link "Organizaciones"
    click_link "Organizaciones"

    expect(page).to have_content "Ally org"
    expect(page).to have_content "org@ally.com"
    expect(page).not_to have_content "Admin org"
    expect(page).not_to have_content "org@admin.com"
  end
end
