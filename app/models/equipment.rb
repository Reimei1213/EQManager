class Equipment < ApplicationRecord
    belongs_to :group
    belongs_to :classification
end
