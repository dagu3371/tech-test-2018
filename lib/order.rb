class Order
  DEFAULT_PRICE = 6.95

  attr_accessor :user

  def initialize(user)
    @user = user
    @voucher = user.voucher
  end

  def total
    voucher_type = @voucher.nil? ? nil : @voucher.type
    case voucher_type
    when :discount
      @voucher.calculate_discount
    when :credit
      @voucher.calculate_credit
    when :loyalty
      @voucher.calculate_loyalty
    else
      return DEFAULT_PRICE
    end
  end
end
