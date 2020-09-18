# frozen_string_literal: true

module Spree
  class PayuController < Spree::BaseController
    def create
      access_token = PayuAccessToken.execute!

      redirect = PayuCreateOrder.execute!(
        params[:order],
        access_token,
        request.remote_ip
      )

      redirect_to redirect
    end

    def payment_status
      order = Order.find_by(number: params["order"])
      begin
      notice = PayuCheckStatus.execute!(
        order.number,
        PayuAccessToken.execute!
      )
      rescue NoMethodError
        notice = "Order not registered on PayU, please consider cancelling it"
      end
      redirect_to request.referer, flash: { notice: notice }
    end
  end
end
