class Character < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { in: 4..20 }, format: { with: /\A[a-zA-Z\d]+\z/, message: "only allows letters and numbers" }
end
