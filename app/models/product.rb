class Product < ApplicationRecord
  belongs_to :category
  before_validation :set_premium
  validates :price, presence: true
  scope :premium, -> { where(premium: true)}
  scope :last_n, -> (n) { order('updated_at desc').limit(n)}
  after_destroy :delete_category

 	def set_premium
  		unless premium.present?
  			self.premium = false
  		end
	end

	def delete_category
		categories = Category.all
	 	categories.each do |category|
	 		unless category.products.any? #false
	 			#category.products.empty? #true
	 			category.destroy
	 		end
	 	end
	end

	def precio_final
		@precio_final = (self.price*self.category.discount).to_f/100
	end

end
