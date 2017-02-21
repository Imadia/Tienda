class RemoveDiscountFromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :discount, :integer
  end
end
