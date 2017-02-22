class Category < ApplicationRecord
	has_many :products, dependent: :destroy
	before_save :validate_discount
	
	def validate_discount
	    if self.discount.nil?
	      self.discount=0
		    elsif self.discount<0
		      self.discount=0
		    elsif self.discount>100
		      self.discount=100
	    end
		# if self.discount > 100 || self.discount < 0
		# 	errors.add(:discount, "El descuento debe ser un valor entre 0 y 100")
		# end
	end
end