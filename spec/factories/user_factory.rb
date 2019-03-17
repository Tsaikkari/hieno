FactoryBot.define do
    sequence(:email) { |n| "user#{n}@example.com" }
    factory :user do
        email 
        password ...
        first_name 
        last_name 
        admin
        created_at 
        updated_at
    end

    factory :admin, class: User do
        email 
        password ...
        admin 
        first_name 
        last_name 
        created_at
        updated_at
    end
  end