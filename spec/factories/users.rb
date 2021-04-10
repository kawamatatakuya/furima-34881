FactoryBot.define do
  factory :user do
    nickname {"やまだ"}
    email {Faker::Internet.free_email}
    password = "a111111"
    password {password} 
    password_confirmation {password}
    last_name {"山田"}
    last_name_kana {"ヤマダ"}
    first_name {"太郎"}
    first_name_kana {"タロウ"}
    birth_date {"1930-01-01"}
  end
end