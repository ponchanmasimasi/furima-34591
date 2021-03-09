FactoryBot.define do
  factory :item do
    # @item { Faker::Lorem.sentence }

    name              { '商品名' }
    explanation       { '説明文' }
    category_id       { 1 }
    condition_id      { 3 }
    postage_type_id   { 2 }
    prefecture_id     { 33 }
    preparation_day_id { 2 }
    value              {'777'} 

    association :user
    # association :item_purchase

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
