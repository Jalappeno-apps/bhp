# This migration comes from spree_simple_sales (originally 20200902092811)
class AddSalePriceToSpreeVariants < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_variants, :sale_price, :decimal
  end
end
