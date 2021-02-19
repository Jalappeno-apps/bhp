# Frozen_String_Literal: true

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
				redirect_with_notice "Nowy baner został dodany do strony głównej"
			else
				flash.notice = "Nie można załadować tego pliku"
				render 'Nowy'
			end
		end

		def destroy
			@hero_image.destroy
			redirect_with_notice "Zdjęcie zostało usunięte z powodzeniem"
		end

		private
		def hero_image_params
			params.require(:hero_image).permit(:image)
		end

		def redirect_with_notice(message)
			flash.notice = message
			redirect_to hero_images_path
		end

		def set_hero_image
			id = params[:id].to_i

			begin
				@hero_image = Spree::HeroImage.find(id)

			rescue ActiveRecord::RecordNotFound
				redirect_with_notice("Zdjęcie o numerze ID#{id} nie zostało znalezione")

			rescue StandardError
				redirect_with_notice("Ups! Nieznany błąd. Skontaktuj się z twórcą strony")
			end			# Rescue block
		end				# end of set_hero_image definition
	end					# End of HeroImageController
end 					# End of module Spree
