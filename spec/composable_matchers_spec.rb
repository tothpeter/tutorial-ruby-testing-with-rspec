describe "Composer Matchers" do
  it "works with nested data" do
    class Product
      def initialize id, name, category
        @id = id
        @name = name
        @category = category
      end

      def serial_data
        [
            "X-",
            @name[0],
            @category[0],
            @id
        ]
      end
    end


    product = Product.new 24, "Tomato", "Fruit"


    expect(product.serial_data).to match [
      a_string_starting_with("X-"),
      a_string_starting_with("T"),
      a_string_starting_with("F"),
      a_value < 5000
    ] # X-TF24

    # Matchers
    # --------
    # change
    # contain_exactly
    # include(a_string, a_value, a_hash)
    # yield_with_args(a_string, a_hash_including())

    # Matchers arguments
    # ------------------
    # 
    # a_string
    # a_string_starting_with
    # a_hash
    # a_hash_including
    # a_value
    # a_value_within().of()
    # an_instance_of(Product)
  end

  it "compound matchers" do
      string = "Toma"

      expect(string).to start_with("T").and end_with("a")
      expect(50).to eq(50).or eq(20)
    end
end