class Product < ApplicationRecord
  belongs_to :category
  before_validation :set_premium
  validates :price, presence: true
  scope :premium, -> { where(premium: true)}
  scope :last_n, -> (n) { order('updated_at desc').limit(n)}

  def set_premium
  	unless premium.present?
  		self.premium = false
  	end
	end
end
