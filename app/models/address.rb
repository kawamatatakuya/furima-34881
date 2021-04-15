class Address < ApplicationRecord
    belongs_to :purchase
end
# before_action :authenticate_user!