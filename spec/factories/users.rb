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

# nickname              {Faker::Name.initials(number: 2)}
# email                 {Faker::Internet.free_email}
# password              {Faker::Internet.password(min_length: 6)}
# password_confirmation {password}
# password = Faker::Internet.password(min_length: 6)
# | Column             | Type                | Options                     |
# |--------------------|---------------------|-----------------------------|
# | email              | string              | null: false , unique: true  |
# | encrypted_password | string              | null: false                 |
# | nickname           | string              | null: false                 |
# | last_name          | string              | null: false                 |
# | last_name_kana     | string              | null: false                 |
# | first_name         | string              | null: false                 |
# | first_name_kana    | string              | null: false                 |
# | birth_date         | date                | null: false                 |

# Faker::Name.name             #=> "Tyshawn Johns Sr."
# Faker::Name.name_with_middle #=> "Aditya Elton Douglas"
# Faker::Name.first_name       #=> "Kaci"
# Faker::Name.middle_name      #=> "Abraham"
# Faker::Name.male_first_name   #=> "Edward"
# Faker::Name.female_first_name #=> "Natasha"
# Faker::Name.last_name        #=> "Ernser"
# Faker::Name.prefix           #=> "Mr."
# Faker::Name.suffix           #=> "IV"