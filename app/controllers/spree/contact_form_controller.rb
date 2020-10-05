# frozen_string_literal: true

module Spree
  class ContactFormController < Spree::BaseController
    def create
      ContactFormMailer.inquiry_email(
        params["email"],
        params["name"],
        params["company"],
        params["nip"],
        params["message"], 
        ENV['DELIVER_EMAIL']
      ).deliver_now
      flash[:success] = "Dziękujemy za kontakt, wrócimy niebawem z odpowiedzią!"
      redirect_to "/#", flash: { success: "Dziękujemy za kontakt, wrócimy niebawem z odpowiedzią!" }
    end
  end
end
