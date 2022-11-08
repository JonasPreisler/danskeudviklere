class Search < ApplicationRecord

  def self.results(params)
    filter_params = params.slice(:programming_languages, :city, :role_levels)
    return Developer.filter(filter_params)
  end

  def self.create_new(params)
    Search.create(
      programming_languages: params[:programming_languages],
      city:                  params[:city],
      role_level:            params[:role_levels]
    )
  end

end