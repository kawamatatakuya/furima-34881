class Purchase < ApplicationRecord
    has_one :address
    belongs_to :item
    belongs_to :user
end
# before_action :authenticate_user!