require 'rails_helper'

RSpec.describe do
  describe "when a guest visits the root path they can search for items" do
    it "allows them to search and return appropriate results from best buy api" do
      visit root_path
      save_and_open_page

    end
  end
end
