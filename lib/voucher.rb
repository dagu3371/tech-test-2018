class Voucher
  DEFAULT_PRICE = 6.95
  attr_accessor :type, :amount, :number, :instant, :loyalty_points

  def initialize(type, **attrs)
    @type = type
    @amount = attrs[:amount]
    @number = attrs[:number]
    @instant = attrs[:instant]
    @loyalty_points = attrs[:loyalty_points]
  end

  def self.create(type, **attrs)
    new(type, **attrs)
  end

  def calculate_loyalty
    if @loyalty_points == @number
      @loyalty_points = 0
      return 0.0
    else
      @loyalty_points += 1
      return DEFAULT_PRICE
    end
  end

  def calculate_credit
    @amount -= DEFAULT_PRICE
    if @amount < 0.0
      return @amount.abs
    else
      return 0.0
    end
  end

  def calculate_discount
    if @number > 0
      discount = @instant == true ? instant_pay : pay_as_you_go
      @number -= 1
      return discount
    else
      return DEFAULT_PRICE
    end
  end

  private

  def instant_pay
    bulk_cost = discounted_price * @number
    @amount = DEFAULT_PRICE * (@number - 1)
    @type = :credit
    return bulk_cost
  end

  def pay_as_you_go
    discounted_price
  end

  def discounted_price
    DEFAULT_PRICE * (@amount.to_f/100)
  end
end
