require "bootstrap"

# Define the test case
describe Bootstrap do
  # Actual test
  it "says hello" do
    # Epection, assertion
    expect(Bootstrap.new.hello).to include "Hello"
  end
end