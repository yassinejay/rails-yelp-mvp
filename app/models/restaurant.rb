class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true, blank: false
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian)}

  has_many :reviews, dependent: :destroy
end
