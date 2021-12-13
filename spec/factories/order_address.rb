FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id  { 2 }
    city              { '名古屋市' }
    address           { '1-1' }
    address_line1     {'マンション101'}
    tell              { '09011112222' }
    token             { 'tok_abcdefghijk00000000000000000' }
  end
end
