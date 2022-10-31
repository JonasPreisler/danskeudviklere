class RouterTwo

  def initialize(domain:, protocol: 'https')
    @domain = domain
    @protocol = protocol
  end

  def url_for(object)
    "#{@protocol}://#{object.blog.subdomain}.#{@domain}/#{object.slug}"
  end

  private

  attr_reader :domain, :protocol


end