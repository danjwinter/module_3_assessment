require 'rails_helper'

RSpec.describe do
  describe "when a guest visits the root path they can search for items" do
    it "allows them to search and return appropriate results from best buy api" do
      visit root_path

      # save_and_open_page

      fill_in :search_search_field, with: "sennheiser"
      click_on "Search"

      expect(current_path).to eq "/search"

      within(".items") do
        expect(page).to have_selector('li', count: 15)
      end

      within(".items li:first-child") do
        expect(page).to have_content "sku"
        expect(page).to have_content "name"
        expect(page).to have_content "customer average review"
        expect(page).to have_content "short description"
        expect(page).to have_content "sale price"
        expect(page).to have_content "image"
      end
    end
  end
end
