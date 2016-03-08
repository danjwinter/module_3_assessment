require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "Get #index" do
    it "returns a JSON response with all of the items" do
      Item.create(name: "Chocolate covered banana",
                  description: "The Bluth Way",
                  image_url: "http://bakedbree.com/wp-content/uploads/2010/07/july-18-2010-64web.jpg")

      Item.create(name: "Chocolate covered banana2",
                  description: "The Bluth Way2",
                  image_url: "http://bakedbree.com/wp-content/uploads/2010/07/july-18-2010-64web.jpg")

      get :index, format: :json

      items_response = json_response[:items]
      expect(items_response.count).to eq 2
      expect(items_response.first).to have_key :name
      expect(items_response.first).to have_key :description
      expect(items_response.first).to have_key :image_url
      expect(items_response.first).to_not have_key :created_at
      expect(items_response.first).to_not have_key :updated_at

    end
  end
end
