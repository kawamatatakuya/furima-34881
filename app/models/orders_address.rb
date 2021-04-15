class OrdersAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :city, :address, :building, :phone, :shipment_street_id, :user_id, :item_id, :token

    with_options presence: true do
        validates :postal_code
        validates :city
        validates :address
        validates :phone
        validates :shipment_street_id
        validates :user_id
        validates :item_id
        validates :token
    end

    def save
        purchase = Purchase.create(item_id: item_id, user_id: user_id)
        Address.create(postal_code: postal_code, city: city, address: address, building: building, phone: phone, shipment_street_id: shipment_street_id, purchase_id: purchase.id)
    end
end