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
  let(:calculator) { PriceCalculator.new }

  it "provides stubs to simulate state" do

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

  it "provides mocks to assert on message passing" do
    product_mock = double(:product)
    # we want the price message received/called
    # expect(product_mock).to receive(:price).with(2)
    # expect(product_mock).to receive(:price).with(no_args)
    # expect(product_mock).to receive(:price).with(any_args)
    # expect(product_mock).to receive(:price)
    # expect(product_mock).to receive(:price).once
    # expect(product_mock).to receive(:price).exactly(3).times.and_return(5)
    expect(product_mock).to receive(:price).at_least(3).times.and_return(5)

    calculator.add product_mock
    calculator.add product_mock
    calculator.add product_mock

    calculator.final_price
  end

  it "provides mocks to assert on message passing2" do
    allow_any_instance_of(Product).to receive(:price) { 5 }
    # expect_any_instance_of(Product).to receive(:price) { 5 }

    product = Product.new 1,2,3

    product.price
  end
end