class PayuStatusWorker
  include Sidekiq::Worker

  def perform(order_number)
    order = Order.find_by(number: order_number)
    return if order.canceled? || order.paid?

    access_token = PayuAccessToken.execute!
    
    PayuCheckStatus.execute!(
      order.number,
      access_token
    )
  end
end