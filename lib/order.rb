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
      calculate_discount
    when :credit
      calculate_credit
    when :loyalty
      calculate_loyalty
    else
      return DEFAULT_PRICE
    end
  end

  def calculate_loyalty
    if @voucher.loyalty_points == @voucher.number
      @voucher.loyalty_points = 0
      return 0.0
    else
      @voucher.loyalty_points += 1
      return DEFAULT_PRICE
    end
  end

  def calculate_credit
    @voucher.amount = @voucher.amount - DEFAULT_PRICE
    cost = @voucher.amount
    if cost < 0
      @voucher.amount = 0.0
      return cost.abs
    else
      return 0.0
    end
  end

  def calculate_discount
    if @voucher.number > 0
      discount = @voucher.instant == true ? instant_pay : pay_as_you_go
      @voucher.number -= 1
      return discount
    else
      return DEFAULT_PRICE
    end
  end

  private

  def instant_pay
    bulk_cost = discounted_price * @voucher.number
    @voucher.amount = DEFAULT_PRICE * (@voucher.number - 1)
    @voucher.type = :credit
    return bulk_cost
  end

  def pay_as_you_go
    discounted_price
  end

  def discounted_price
    DEFAULT_PRICE * (@voucher.amount.to_f/100)
  end
end
