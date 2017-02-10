require 'rails_helper'

  describe "User edits an existing category" do
    scenario "user can edit a category" do
      category = Category.create!(title: "Tech")
      visit edit_category_path(category)

      fill_in "category[title]", with: "IT"
      click_button "Update"

      expect(current_path).to eq("/categories/#{Category.last.id}")
      expect(page).to have_content("IT")
      expect(page).to_not have_content("Tech")

    end
  end
