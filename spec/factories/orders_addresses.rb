FactoryBot.define do
  factory :orders_address do
    postal_code {"111-1111"}
    city {"札幌市"}
    address {"1-1-1"} 
    building {"101"}
    phone {"11111111111"}
    shipment_street_id {2}

    token {"tok_abcdefghijk00000000000000000"}
  end
end