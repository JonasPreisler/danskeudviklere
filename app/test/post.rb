class Post
  attr_reader :title, :content, :slug, :blog

  def initialize(title:, content:, blog:)
    @title = title
    @content = content
    @blog = blog
    @slug = title.downcase.gsub(' ', '-')
  end

  def add_post(title:, content:)
    post = Post.new(title: title, content: content, blog: self)
    @post << post
    post
  end

end