module Spree
  class HomeController < Spree::StoreController
    def index
	    @hero_images = Spree::HeroImage.all.map { |x|
          main_app.url_for(x.image)
      }
    end
  end
end
