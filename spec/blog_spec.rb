require "blog"
require "post"

describe Blog do

  context "with no posts" do
    let(:post) { Blog.new }

    it "has no posts" do
      expect(post).to be_empty
    end
  end
  
  context "with one post" do
    let(:post) { Blog.new(posts: [ Post.new ]) }

    it "has a post when initialized with one" do
      expect(post).not_to be_empty
    end

    it "counst the number of posts" do
      expect(post.post_count).to eq 1
    end
  end
  
end