class Order
  DEFAULT_PRICE = 6.95

  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def total
    price = DEFAULT_PRICE

    user.orders.each do |order|
      price - order.total
    end

    price
  end
end
