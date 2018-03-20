class Voucher
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
end
