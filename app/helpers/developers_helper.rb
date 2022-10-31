module DevelopersHelper

  def zip_codes
    JSON.parse(File.read("#{Rails.root}/app/zip_codes.json"))
  end
end
