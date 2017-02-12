require 'rails_helper'

  describe "User creates a comment for a specific job" do
    scenario "they create a comment" do
      category = Category.create!(title: "IT")
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

      visit company_job_path(company, job)

      fill_in "comment[author_name]", with: "John"
      fill_in "comment[body]", with: "Contacted Janice in HR"

      click_button "Submit"

      expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
      expect(page).to have_content("Comment by John")
      expect(page).to have_content("Contacted Janice in HR")

    end
  end
