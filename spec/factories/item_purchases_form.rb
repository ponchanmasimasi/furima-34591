FactoryBot.define do
  factory :item_purchases_form do
    postal_code      { '777-7777' }
    prefecture_id    { 1 }
    city             { '市区町村' }
    address          { '番地' }
    building_name    { '建物名' }
    phone_number     { '1234567890' }
    token            { 'text' }
  end
end
