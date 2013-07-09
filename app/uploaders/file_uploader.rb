# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base

  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "upload/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :mini do
    process :resize_to_fill => [50, 50]
  end

  version :thumb do
    process :resize_to_fill => [204, 184]
  end

  version :large do
    process :resize_to_fill => [440, 330]
  end

end