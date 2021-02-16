module Spree
	class HeroImageController < Spree::Admin::BaseController
		before_action :set_hero_image, only: %i(view destroy)

		def index
			@hero_images = Spree::HeroImage.select { |x|
				x.image.attached?
			}
		end

		def new
			@hero_image = Spree::HeroImage.new
		end

		def view
		end

		def create
			@hero_image = Spree::HeroImage.create(hero_image_params)
			if @hero_image.save
				redirect_to hero_images_path
			else
				render 'new'
			end
		end

		def destroy
			@hero_image.destroy

			respond_to do |f|
				f.html {
					redirect_to  hero_images_path, notice: "Image was successfully removed"
				}
			end
		end

		private
		def hero_image_params
			params.require(:hero_image).permit(:image)
		end

		def set_hero_image
			@hero_image = Spree::HeroImage.find(params[:id])
		end
	end
end
