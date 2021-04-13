FactoryBot.define do
  factory :item do
    product {"しょうひんめい"}
    product_description {"しょうひんせつめい"}
    category_id {2} 
    status_id {2}
    delivery_fee_id {2}
    shipment_street_id {2}
    shipment_day_id {2}
    price {1000}
    after(:build) do |image|
      image.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
    association :user
  end
end