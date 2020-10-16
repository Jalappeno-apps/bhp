# frozen_string_literal: true

module Spree
  class CookieController < Spree::BaseController
    def create
      cookies[:cookie] = true
    end
  end
end
