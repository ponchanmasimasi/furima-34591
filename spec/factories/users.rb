FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'ss11111' }
    password_confirmation { 'ss11111' }
    first_name            { 'かな' }
    family_name           { 'かな' }
    read_first            { 'カナ' }
    read_family           { 'カナ' }
    birth                 { '2000-01-01' }
  end
end
