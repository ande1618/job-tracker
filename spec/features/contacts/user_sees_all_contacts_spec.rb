require 'rails_helper'

describe "User sees all contacts" do
  scenario "a user sees all the contacts for a specific company" do
    company = Company.create!(name: "ESPN")
    contact_1 = company.contacts.create!(name: "Jan Lewis", position: "Human Resources", email: "Jan@espn.com")
    contact_2 = company.contacts.create!(name: "Bernice Rothelsberger", position: "Human Resources", email: "Bernice@espn.com")

    visit company_contacts_path(company)

    expect(page).to have_content("Contacts at ESPN")
    expect(page).to have_content("Name: Bernice Rothelsberger")
    expect(page).to have_content("Email: Jan@espn.com")
  end
end
