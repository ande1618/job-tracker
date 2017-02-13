require 'rails_helper'

  describe "User creates a new contact" do
    scenario "They create a contact for a given company" do
      company = Company.create!(name: "ESPN")
      contact_1 = company.contacts.create!(name: "Jan Lewis", position: "Human Resources", email: "Jan@espn.com")
      contact_2 = company.contacts.create!(name: "Bernice Rothelsberger", position: "Human Resources", email: "Bernice@espn.com")

        visit company_contacts_path(company)

        within(".contact_#{contact_2.id}") do
          click_button "Delete"
        end
        expect(page).to have_content "Bernice Rothelsberger was successfully deleted!"
        expect(page).to_not have_content "Email: Bernice@espn.com"


    end
  end
