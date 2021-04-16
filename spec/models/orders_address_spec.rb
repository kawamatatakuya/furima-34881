require 'rails_helper'

RSpec.describe OrdersAddress, type: :model do
 
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @orders_address = FactoryBot.build(:orders_address, user_id: @user.id, item_id: @item.id)
    sleep (0.5)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it '住所とtokenが正しく入力されていれば購入できる' do
        expect(@orders_address).to be_valid
      end
      it '建物名が抜けていても登録できること' do
        @orders_address.building = ""
        expect(@orders_address).to be_valid
      end
      it '電話番号が11桁未満でも登録できる' do
        @orders_address.phone = "1111111111"
        expect(@orders_address).to be_valid
      end
    end
    context '購入できないとき' do
      it '郵便番号が空では登録できない' do
        @orders_address.postal_code = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '郵便番号のハイフンの位置が正しくないと登録できない' do
        @orders_address.postal_code = "1111-111"
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号にハイフンが入っていないと登録できない' do
        @orders_address.postal_code = "1111111"
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号が全角数字では登録できない' do
        @orders_address.postal_code = "１１１-１１１１"
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '市町村が空では登録できない' do
        @orders_address.city = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @orders_address.address = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @orders_address.phone = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が12桁以上では登録できない' do
        @orders_address.phone = "111111111111"
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Phone is too long (maximum is 11 characters)")
      end
      it '電話番号が全角数字では登録できない' do
        @orders_address.phone = "１１１１１１１１１１１"
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Phone is invalid")
      end
      it 'トークンが空では登録できない' do
        @orders_address.token = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと登録できない' do
        @orders_address.user_id = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @orders_address.item_id = ""
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Item can't be blank")
      end
      it '都道府県が選択されていない場合は登録できない' do
        @orders_address.shipment_street_id = 1
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Shipment street must be other than 1")
      end
      it '電話番号は英数混合では登録できないこと' do
        @orders_address.phone = "a1111111111"
        @orders_address.valid?
        expect(@orders_address.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end