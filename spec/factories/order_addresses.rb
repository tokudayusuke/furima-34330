FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '墨田区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'12312341234'}

  end
end
