class Voucher
  attr_accessor :type, :credit, :discount, :number, :instant

  def initialize(type, **attrs)
    @type = type
    @credit = attrs[:credit]
    @discount = attrs[:discount]
    @number = attrs[:number]
    @instant = attrs[:instant]
  end

  def self.create(type, **attrs)
    new(type, **attrs)
  end
end
