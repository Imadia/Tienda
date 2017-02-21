class Product < ApplicationRecord
  belongs_to :category
  before_validation :set_premium
  validates :price, presence: true
  validate :validate_discount
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
	 		unless category.products.any?
	 			category.destroy
	 		end
	 	end
	end

	def validate_discount
		if discount > 100 || discount < 0
			errors.add(:discount, "El descuento debe ser un valor entre 0 y 100")
		end
	end

	def precio_final
		@precio_final = (self.price*self.discount).to_f/100
	end

end
