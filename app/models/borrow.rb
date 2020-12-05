class Borrow < ApplicationRecord
    belongs_to :group_user
    belongs_to :equipment
end
