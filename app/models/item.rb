class Item < ApplicationRecord
    with_options presence: true do
        validates :image
        validates :product
        validates :product_description
        validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    end
    with_options presence: true, numericality: { other_than: 1 }  do
        validates :category_id
        validates :status_id
        validates :delivery_fee_id
        validates :shipment_street_id
        validates :shipment_day_id
    end
    has_one_attached :image
    belongs_to :user
    has_one :purchase
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :shipment_street
    belongs_to :shipment_day
end