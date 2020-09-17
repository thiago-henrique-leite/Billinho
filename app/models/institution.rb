class Institution < ApplicationRecord
    validates :name, presence: true
    validates :tipo, presence: true
end
