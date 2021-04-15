class OrdersAddress

    include ActiveModel::Model
    attr_accessor :postal_code, :city, :address, :building, :phone, :shipment_street_id, :user_id, :item_id
    # :prefecture, :city, :house_number, :building_name, :price, :user_id

    # ここにバリデーションの処理を書く
    with_options presence: true do
        validates :postal_code
        validates :city
        validates :address
        validates :phone
        validates :shipment_street_id
        validates :user_id
        validates :item_id
    end

    def save
        # 各テーブルにデータを保存する処理を書く
        purchase = Purchase.create(item_id: item_id, user_id: user_id)
        Address.create(postal_code: postal_code, city: city, address: address, building: building, phone: phone, shipment_street_id: shipment_street_id, purchase_id: purchase.id)

        # 寄付情報を保存し、変数donationに代入する
        # donation = Donation.create(price: price, user_id: user_id)
        # 住所を保存する
        # donation_idには、変数donationのidと指定する
        # Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
    end
end