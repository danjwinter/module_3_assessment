require 'rails_helper'

RSpec.describe do
  describe "when a guest visits the root path they can search for items with one word" do
    it "allows them to search and return appropriate results from best buy api" do
      VCR.use_cassette("best_buy_service#search_one_word") do
        visit root_path

        # save_and_open_page

        fill_in :search_search_field, with: "sennheiser"
        click_on "Search"

        expect(current_path).to eq "/search"



        within(".items") do
          expect(page).to have_selector('li', count: 15)
        end

        within(".items li:first-child") do
          expect(page).to have_content "sku 9678429"
          expect(page).to have_content "name Sennheiser - Camera-Mount Wireless Microphone System - Black"
          expect(page).to have_content "customer average review not given"
          expect(page).to have_content "short description SENNHEISER Camera-Mount Wireless Microphone System: Invisible clip-on microphone; sturdy metal housing; automatic frequency management; easy-to-read illuminated display; 4-level battery indicator; 626-668MHz frequency range"
          expect(page).to have_content "sale price 629.95"
          expect(page).to have_content "image http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sa.jpg"
          expect(page).to_not have_content "regular price 629.95"
          expect(page).to_not have_content "low price guarantee"
        end
      end
    end
  end

  describe "they can search for items with multiple words" do
    it "returns pertinent search results for multiple words" do
      VCR.use_cassette("best_buy_service#seach_multiple_words") do
        visit root_path

        # save_and_open_page

        fill_in :search_search_field, with: "sennheiser headphones white"
        click_on "Search"

        expect(current_path).to eq "/search"



        within(".items") do
          expect(page).to have_selector('li', count: 15)
        end

        within(".items li:first-child") do
          expect(page).to have_content "sku 9678429"
          expect(page).to have_content "name Sennheiser - Camera-Mount Wireless Microphone System - Black"
          expect(page).to have_content "customer average review not given"
          expect(page).to have_content "short description SENNHEISER Camera-Mount Wireless Microphone System: Invisible clip-on microphone; sturdy metal housing; automatic frequency management; easy-to-read illuminated display; 4-level battery indicator; 626-668MHz frequency range"
          expect(page).to have_content "sale price 629.95"
          expect(page).to have_content "image http://images.bestbuy.com/BestBuy_US/images/products/9678/9678429_sa.jpg"
          expect(page).to_not have_content "regular price 629.95"
          expect(page).to_not have_content "low price guarantee"
        end
      end
    end
  end
end
