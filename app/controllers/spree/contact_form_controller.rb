# frozen_string_literal: true

module Spree
  class ContactFormController < Spree::BaseController
    def create

      puts params
      # ContactFormMailer.inquiry_email()
      redirect_to root_path
    end
  end
end
