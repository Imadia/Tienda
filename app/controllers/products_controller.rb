class ProductsController < ApplicationController
  def index
  	if params[:search_name].present?
  		producto_nombre = params[:search_name]
  		@p = Product.where("name like ?", "%#{producto_nombre}%")
  	
	elsif params[:search_price].present?
  		producto_precio = params[:search_price]
  		@p = Product.where(price: producto_precio)
  		
  	else
  		@p = Product.all
  	end
  end

  def categories_index
  	
  end

  
end
