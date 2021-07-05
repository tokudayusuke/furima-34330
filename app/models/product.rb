class Product < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_cost
  belongs_to :delivery_day
  belongs_to :product_area
  has_one :order


  with_options presence: true do
    validates :name
    validates :description
    validates :sale_price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
    validates :image
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_cost_id
      validates :delivery_day_id
      validates :product_area_id
    end
    validates :sale_price, numericality: true
    
end

