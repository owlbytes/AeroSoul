# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "dan@apple.com"
    password "password"
    role "user"
    confirmed_at Time.now

    factory :admin do 
      role "admin"
    end

  end
end

 
              