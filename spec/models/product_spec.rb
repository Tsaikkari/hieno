require 'rails_helper'

describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "race bike", description: "nice", image_url: "racebike.jpg", colour: "blue", price: "50") }
    let(:user) { User.create!(password: "password", email: "email@gmx.de") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike!")).not_to be_valid
    end

    it "is valid with a description" do
      expect(Product.new(name: "race bike", description: "Great bike!", image_url: "racebike.jpg", colour: "blue", price: "50")).to be_valid
    end

    it "is not valid without an image_url" do
      expect(Product.new(name: "race bike", description: "Great bike!", colour: "blue", price: "50")).not_to be_valid
    end

    it "is valid with a colour" do
      expect(Product.new(name: "race bike", description: "Great bike!", image_url: "racebike.jpg", colour: "blue", price: "50")).to be_valid
    end 

    it "is not valid without a price" do 
      expect(Product.new(name: "race bike", description: "Great bike!", image_url: "racebike.jpg", colour: "blue")).not_to be_valid
    end
  end
end
