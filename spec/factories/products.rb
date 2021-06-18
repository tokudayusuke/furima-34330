FactoryBot.define do
  factory :product do
    image  {Faker::Lorem.sentence}
    nickname  {"fish"}
    description {"aaa"}
    condition_id  {2}
    delivery_cost_id  {2}
    product_area_id {2}
    delivery_day_id {2}
    sale_price  {1000}
    category_id {2} 
    association :user
  end
end
