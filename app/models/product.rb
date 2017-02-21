class Product < ApplicationRecord
  belongs_to :category
  before_validation :set_premium
  validates :price, presence: true

  def set_premium
  	unless premium.present?
  		self.premium = false
  	end
	end
end
