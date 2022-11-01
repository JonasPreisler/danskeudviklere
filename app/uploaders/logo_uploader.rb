class LogoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  # Create different versions of your uploaded files:
  version :size_40px do
    process resize_to_fill: [80, 80]
  end

  version :size_200px do
    process resize_to_fill: [400, 400]
  end

  def extension_allowlist
    %w(jpg jpeg png)
  end

end
