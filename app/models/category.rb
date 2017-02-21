class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	validate :validate_discount
	
	def validate_discount
		if discount > 100 || discount < 0
			errors.add(:discount, "El descuento debe ser un valor entre 0 y 100")
		end
	end
end