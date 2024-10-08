FactoryBot.define do
  factory :comment do
    user
    post
    content { FFaker::Lorem.sentence }
  end
end
