class Voucher
  attr_accessor :type, :amount, :number, :instant

  def initialize(type, **attrs)
    @type = type
    @amount = attrs[:amount]
    @number = attrs[:number]
    @instant = attrs[:instant]
  end

  def self.create(type, **attrs)
    new(type, **attrs)
  end
end
