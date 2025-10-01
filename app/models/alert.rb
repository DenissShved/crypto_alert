class Alert < ApplicationRecord
  belongs_to :user

  validates :coin, presence: true
  validates :target_price, presence: true, numericality: { greater_than: 0 }
  validates :condition, inclusion: { in: %w[above below] }
end
