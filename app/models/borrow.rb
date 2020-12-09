class Borrow < ApplicationRecord
    belongs_to :equip
    belongs_to :group_user
end
