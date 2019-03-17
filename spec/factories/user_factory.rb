FactoryBot.define do
    sequence(:email) { |n| "user#{n}@example.com" }
    factory :user do
        email 
        password { "1234567" }
        first_name { "Maria" }
        last_name  { "Mai" }
        admin { false  }
    end

    factory :admin, class: User do
        email 
        password { "13691215" }
        first_name { "Anna" }
        last_name { "Meer" }
    end
end