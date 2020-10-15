class AddNipToSpreeAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_addresses, :nip, :string
  end
end
