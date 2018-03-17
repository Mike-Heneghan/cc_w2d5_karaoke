class Guest


attr_reader :name, :wallet

  def initialize(input_name)
    @name = input_name
    @wallet = 20
  end

  def pay_entrance_fee(entrance_cost)
    @wallet -= entrance_cost
  end

end
