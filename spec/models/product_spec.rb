require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品出品機能' do
    before do
      @product = FactoryBot.build(:product)

    end

    context '商品出品がうまくいくとき' do
      it 'name, description, condition_id, delivery_cost_id, product_area_id, delivery_day_id, sale_price, category_id, user_id が存在すれば出品できる' do

        expect(@product).to be_valid
      end
    end


    context '商品出品ができない時' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?

        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空だと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end

      it '商品の状態が空だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition is not a number")
      end

      it '配送料の負担が空だと出品できない' do
        @product.delivery_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost is not a number")
      end

      it '発送元の地域が空だと出品できない' do
        @product.product_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product area is not a number")
      end

      it '発送までの日数が空だと出品できない' do
        @product.delivery_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day is not a number")
      end

      it '販売価格が空だと出品できない' do
        @product.sale_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Sale price can't be blank")
      end

      it '販売価格は、¥300以下では出品できない' do
        @product.sale_price = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Sale price is not included in the list")
      end

      it '販売価格は、¥9,999,999以上では出品できない' do
        @product.sale_price = 100_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include("Sale price is not included in the list")
      end

      it '販売価格は、全角数字では出品できない' do
        @product.sale_price = '１１１１'
        @product.valid?
        expect(@product.errors.full_messages).to include("Sale price is not included in the list")
      end

      it '半角英数混合では登録できないこと' do
        @product.sale_price = 'aa11'
        @product.valid?
        expect(@product.errors.full_messages).to include("Sale price is not a number")
      end

      it '半角英語だけでは登録できないこと' do
        @product.sale_price = 'aaaa'
        @product.valid?
        expect(@product.errors.full_messages).to include("Sale price is not a number")
      end

      it 'category_idが「1」では登録できないこと' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it 'condition_idが「1」では登録できないこと' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'delivery_cost_idが「1」では登録できないこと' do
        @product.delivery_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost must be other than 1")
      end

      it 'product_area_idが「1」では登録できないこと' do
        @product.product_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Product area must be other than 1")
      end

      it 'delivery_day_idが「1」では登録できないこと' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day must be other than 1")
      end
    end

  end
end
