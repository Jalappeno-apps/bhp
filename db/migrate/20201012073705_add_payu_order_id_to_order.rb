class AddPayuOrderIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_orders, :payu_order_id, :string
  end
end
