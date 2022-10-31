class Blog
  attr_reader :title, :subdomain, :post

  def initialize(title:, subdomain:)
    @title = title
    @subdomain = subdomain
    @posts = []
  end

  def add_post(title:, content:)
    post = Post.new(title: title, content: content, blog: self)
    @post << post
    post
  end

end