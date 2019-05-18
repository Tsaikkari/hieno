FactoryBot.define do
    factory :product do
        name { "Product" } 
        description { "Text" }
        image_url { "image.jpg" }
        colour { "Black" }
        price { "50" }
    end 
end