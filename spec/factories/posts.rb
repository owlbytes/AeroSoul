# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence :title do |n| 
      "Title #{n}" 
    end 
    artist "Dan von Trap"
    address "386 Mountain Ave, Ridgewood, NJ 07450, USA"
    medium "spray paint"
    description "Dan Von Trapp creates a work of art"
    tag_list "Dan, Test, Siri"
  end
end


 