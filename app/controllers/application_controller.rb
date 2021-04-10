class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :last_name_kana, :first_name, :first_name_kana, :birth_date])
    end
end

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