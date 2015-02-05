class Product
  attr_reader :price
end

class PriceCalculator
  def add product
    products << product
  end

  def products
    @products ||= []
  end

  def final_price
    @products.map(&:price).inject(&:+)
  end
end

describe "Stubs" do
  it "provides stubs to simulate state" do
    calculator = PriceCalculator.new

    # calculator.add double(price: 1.0)
    # calculator.add double(price: 100.25)

    # first_product = instance_double("Product")
    # allow(first_product).to receive(:price).and_return(1.0)
    # # OR
    # # allow(first_product).to receive(:price) { 1.0 }

    # calculator.add first_product
    # calculator.add instance_double("Product", price: 100.25)

    # OR -------------------------------------------------------
    product_stub = instance_double("Product")
    allow(product_stub).to receive(:price).and_return(1.0, 100.25)

    calculator.add product_stub
    calculator.add product_stub
    # 2.times { calculator.add product_stub }

    expect(calculator.final_price).to eq 101.25
  end
end