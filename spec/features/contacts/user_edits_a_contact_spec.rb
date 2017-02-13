require 'rails_helper'

  describe "User edits an existing contact" do
    scenario "user clicks edit button and changes contact info" do
      company = Company.create!(name: "ESPN")
      contact_1 = company.contacts.create!(name: "Jan Lewis", position: "Human Resources", email: "Jan@espn.com")

      visit company_contacts_path(company)

      within(".contact_#{contact_1.id}") do
        click_button "Edit"
        expect(current_path).to eq "/companies/#{company.id}/contacts/#{contact_1.id}/edit"
      end

      fill_in "contact[name]", with: "Janice Lewis"
      fill_in "contact[email]", with: "Janice@espn.com"
      click_button "Update Contact"

      expect(page).to have_content "Name: Janice Lewis"
      expect(page).to have_content "Email: Janice@espn.com"
      expect(page).to_not have_content "Email: Jan@espn.com"

    end
  end
