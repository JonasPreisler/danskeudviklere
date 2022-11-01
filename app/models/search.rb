class Search < ApplicationRecord

  def self.results(params)
    filter_params = params.slice(:programming_languages, :city)
    return Developer.filter(filter_params)
  end

  def self.create_new(params)
    Search.create(
      programming_languages: params[:programming_languages],
      city: params[:city]
    )
  end

end