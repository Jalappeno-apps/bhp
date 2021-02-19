class CreateSpreeHeroImage < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_hero_images do |t|
      t.string :image
    end
  end
end
