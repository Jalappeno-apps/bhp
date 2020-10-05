# frozen_string_literal: true

module Spree
  class ContactFormController < Spree::BaseController
    def create

      puts params
      # ContactFormMailer.inquiry_email()
      redirect_to root_path, flash: { success: { "Dziękujemy za kontakt, wrócimy niebawem z odpowiedzią!" } }
    end
  end
end
