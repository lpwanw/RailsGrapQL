FactoryBot.define do
  factory :post do
    user
    content { FFaker::Lorem.sentence }
    visibility { Post.visibilities.values.sample }
  end
end
