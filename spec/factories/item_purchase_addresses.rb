FactoryBot.define do
  factory :item_purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '11111111111' }
    token { 'a' }
  end
end
