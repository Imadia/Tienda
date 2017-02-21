Rails.application.routes.draw do
  get 'products/index'
  post 'products/index'
  root 'products#index'
  
  get 'products/categories_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
