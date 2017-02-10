require 'rails_helper'

describe "User creates a new category" do
  context "with valid params" do
    scenario "a user can create a new category" do
      visit new_category_path

      fill_in "category[title]", with: "Tech"
      click_button "Create Category"

      expect(current_path).to eq("/categories/#{Category.last.id}")
      expect(page).to have_content("Tech")
      expect(Category.count).to eq(1)
    end
  end
end
describe "User creates a new category" do
  context "with invalid params" do
    scenario "a user can create a new category" do
      category = Category.create!(title: "Tech")
      visit new_category_path

      fill_in "category[title]", with: "Tech"
      click_button "Create Category"

      expect(current_path).to eq(new_category_path)
    end
  end
end
