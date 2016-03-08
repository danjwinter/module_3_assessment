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

      items_response = json_response
      expect(items_response.count).to eq 2
      expect(items_response.first).to have_key :name
      expect(items_response.first).to have_key :description
      expect(items_response.first).to have_key :image_url
      expect(items_response.first).to_not have_key :created_at
      expect(items_response.first).to_not have_key :updated_at
    end
  end

  describe "Get #show" do
    it "returns JSON response for that item" do
      item = Item.create(name: "Chocolate covered banana",
                         description: "The Bluth Way",
                         image_url: "http://bakedbree.com/wp-content/uploads/2010/07/july-18-2010-64web.jpg")
      get :show, id: item.id, format: :json

      expect(json_response[:name]).to eq item.name
      expect(json_response[:description]).to eq item.description
      expect(json_response[:image_url]).to eq item.image_url
      expect(json_response).to_not have_key :created_at
      expect(json_response).to_not have_key :updated_at
    end
  end

  describe "Delete #destroy" do
    it "returns a 204 response when item is deleted" do
      item = Item.create(name: "Chocolate covered banana",
                         description: "The Bluth Way",
                         image_url: "http://bakedbree.com/wp-content/uploads/2010/07/july-18-2010-64web.jpg")
      delete :destroy, id: item.id, format: :json

      expect(response.status).to eq 204
      expect(Item.count).to eq 0
    end
  end

  describe "Post #create" do
    it "returns created item and a 201 response" do
      post :create, format: :json, name: "Chocolate covered banana",
                                   description: "The Bluth Way",
                                   image_url: "http://bakedbree.com/wp-content/uploads/2010/07/july-18-2010-64web.jpg"

     expect(json_response[:name]).to eq "Chocolate covered banana"
     expect(json_response[:description]).to eq "The Bluth Way"
     expect(json_response[:image_url]).to eq "http://bakedbree.com/wp-content/uploads/2010/07/july-18-2010-64web.jpg"
     expect(json_response).to_not have_key :created_at
     expect(json_response).to_not have_key :updated_at
    end
  end
end
