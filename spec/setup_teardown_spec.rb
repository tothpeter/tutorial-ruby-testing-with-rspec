require "blog"

describe "Callbacks" do
  # It is reinitialized before each test
  let(:blog) { Blog.new }

  # before(:each) do
  #   blog.populate!
  # end

  before(:example) do
    blog.populate!
  end

  # before(:context) do
  #   blog.populate!
  # end

  it "it has one post" do
    expect(blog.post_count).to eq 1
  end

  it "it has one post" do
    expect(blog.post_count).to eq 1
  end
end