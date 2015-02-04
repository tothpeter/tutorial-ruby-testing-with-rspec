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

  it "asserts on truthiness"
  it "asserts errors"
  it "asserts throws"
  it "asserts on predicates"
  it "asserts on collections"
  it "asserts asserts"
end