require 'rails_helper'

RSpec.describe ItemPurchasesForm, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @subscriber = FactoryBot.build(:item_purchases_form, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@subscriber).to be_valid
    end

    it 'tokenがあれば保存ができること' do
      expect(@subscriber).to be_valid
    end

    it '建物名は空でも保存できること' do
      @subscriber.building_name = ''
      expect(@subscriber).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @subscriber.postal_code = ''
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @subscriber.postal_code = '1234567'
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it '都道府県を選択していないと保存できないこと' do
      @subscriber.prefecture_id = 0
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空だと保存できないこと' do
      @subscriber.city = ''
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("City can't be blank")
    end 

    it '電話番号が空だと保存できないこと' do
      @subscriber.phone_number = ''
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が11桁以内でないと保存できないこと' do
      @subscriber.phone_number = '123456999999'
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号は英数混合では登録きないこと' do
      @subscriber.phone_number = '1234569999aa'
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include('Phone number is invalid')
    end  

    it 'tokenが空では登録できないこと' do
      @subscriber.token = nil
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @subscriber.user_id = ''
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと保存できないこと' do
      @subscriber.item_id = ''
      @subscriber.valid?
      expect(@subscriber.errors.full_messages).to include("Item can't be blank")
    end
  end
end

