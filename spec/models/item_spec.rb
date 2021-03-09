require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it '商品名に画像を一枚つけないと保存でできない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品説明がないと保存でできない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it '商品名がないと保存でできない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリーは---では保存でできない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end

      it '商品の状態は---では保存でできない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end

      it '配送料の負担は---では保存でできない' do
        @item.postage_type_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage type must be other than 0')
      end

      it '発送元の地域は---では保存でできない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '発送までの日数は---では保存でできない' do
        @item.preparation_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be other than 0')
      end

      it '販売価格が空だと保存できないこと' do
        @item.value = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end

      it '販売価格が全角数字だと保存できないこと' do
        @item.value = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is invalid")
      end

      it '販売価格が全角及び半角英数字の混合だと保存できないこと' do
        @item.value = '２０aa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is invalid")
      end

      it '販売価格が299円未満では保存できないこと' do
        @item.value = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is invalid")
      end

      it '販売価格が1,000,000円を超過すると保存できないこと' do
        @item.value = 1_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include("Value is invalid")
      end
    end
  end
end
