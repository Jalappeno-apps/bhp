module Spree
  class HeroImage < ApplicationRecord
    has_one_attached :image
  end
end
