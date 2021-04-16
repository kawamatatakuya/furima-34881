class OrdersAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :city, :address, :building, :phone, :shipment_street_id, :user_id, :item_id, :token

    with_options presence: true do
        validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/ }
        validates :city
        validates :address
        validates :phone,       format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
        validates :shipment_street_id, numericality: { other_than: 1 }
        validates :user_id
        validates :item_id
        validates :token
    end
    
    def save
        purchase = Purchase.create(item_id: item_id, user_id: user_id)
        Address.create(postal_code: postal_code, city: city, address: address, building: building, phone: phone, shipment_street_id: shipment_street_id, purchase_id: purchase.id)
    end
end