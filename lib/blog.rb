class Blog

  def initialize posts = []
    @posts = posts
  end

  def empty?
    @posts.empty?
  end

  def post_count
    @posts.count
  end

  def populate!
    @posts << Post.new
  end
end