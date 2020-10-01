class Institution < ApplicationRecord
  has_many :enrollments, dependent: :destroy

  # Performs the necessary validations
  validates :name, presence: { message: 'Institution name not informed.' }
  validates :kind, inclusion: { in: %w[Universidade Escola Creche], message: 'Institution kind invalid or not informed.' }
  #validates :cnpj, :cnpj => true
end
