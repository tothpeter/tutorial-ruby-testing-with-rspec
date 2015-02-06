describe "Matchers" do
  it "asserts on equality" do
    number = 3
    # old
    # number.should == 3
    # new
    expect(number).to eq 3
  end
  
  it "asserts on mathematical operators" do
    number = 5
    # The matcher is "be"
    expect(number).to be >= 2
    # expect(number).to(be >= 2)
  end

  it "asserts on matching a regular expression" do
    email = "hello@tomaaa.com"

    regular_expression = /^\w+@\w+\.[a-z]{2,4}$/

    expect(email).to match regular_expression 
  end

  it "asserts on types and classes" do
    object = 2

    # 2 or 2.0
    expect(object).to be_an Numeric
    # expect(object).to be_an Float
    # expect(object).to be_an_instance_of Numeric
  end

  it "asserts on truthiness" do
    bool = true
    falsy_bool = false
    nil_value = nil
    object = Class.new

    expect(bool).to be true
    expect(falsy_bool).to be false
    expect(nil_value).to be nil
    expect(nil_value).to be_falsy
    expect(object).to be_truthy
  end

  it "asserts errors" do
    expect do
      raise TypeError
    end.to raise_error TypeError

    expect do
      raise ArgumentError
    end.to raise_error
  end

  it "asserts throws" do
    expect {
      throw :oops
    }.to throw_symbol :oops

    expect {
      throw :hooray
    }.to throw_symbol
  end

  # xit "asserts on predicates" do
  #   class A
  #     def good?
  #       raise ArgumentError
  #     end
  #   end

  #   expect(A.new).to be_good
  # end

  # it "skip it", skip: 'Not really important' do
  #   # pending
  #   # skip
  # end

  fit "verry important" do
    # rspec --tag focus
    # we can use "f" for the whole description
  end

  it "asserts on collections" do
    list = [
      :one,
      :two,
      :three,
      :four
    ]

    expect(list).to include :four
    expect(list).to start_with :one
    expect(list).to start_with [ :one, :two ]
    expect(list).to end_with :four
  end

  it "negates asserts" do
    expect(3).not_to be 5
  end
end