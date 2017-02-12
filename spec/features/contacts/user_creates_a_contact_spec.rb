require 'rails_helper'

  describe "User creates a new contact" do
    scenario "They create a contact for a given company" do
      category = Category.create!(title: "IT")
      company = Company.create!(name: "ESPN")

        visit company_path(company)

        click_link("View Contacts")
        expect(current_path).to eq("/companies/#{company.id}/contacts")
        fill_in "contact[name]", with: "Bernice Rothelsberger"
        fill_in "contact[position]", with: "Human Resources"
        fill_in "contact[email]", with: "Bernice@espn.com"
        click_button "Create Contact"

        expect(current_path).to eq("/companies/#{company.id}/contacts")
        expect(page).to have_content "Name: Bernice Rothelsberger"
        expect(page).to have_content "Email: Bernice@espn.com"


    end
  end
