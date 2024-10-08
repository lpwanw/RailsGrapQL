FactoryBot.define do
  factory :user do
    email_address { FFaker::Internet.unique.email }
    password { "Aa@123456" }
  end
end
