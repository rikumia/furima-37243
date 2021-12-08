FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    famiry_name           { '山田' }
    first_name            { '一郎' }
    famiry_name_kana      { 'ヤマダ' }
    first_name_kana       { 'イチロウ' }
    birthday              { '1999-01-01' }
  end
end
