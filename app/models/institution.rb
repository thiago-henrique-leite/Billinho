class Institution < ApplicationRecord
    validates :nome, presence: true
    validates :tipo, presence: true
end
