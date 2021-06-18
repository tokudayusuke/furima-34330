class Product < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :product_area


  with_options presence: true do
    validates :nickname
    validates :description
    validates :sale_price, format: { with: /\A[0-9]+\z/ }
    validates :user
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_cost_id
      validates :delivery_day_id
      validates :product_area_id
    end
    
end

