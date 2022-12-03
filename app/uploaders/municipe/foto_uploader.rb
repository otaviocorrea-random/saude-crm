class Municipe::FotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :pequena do
    process resize_to_fit: [50, 50]
  end

  version :media do
    process resize_to_fit: [350, 350]
  end

  version :grande do
    process resize_to_fit: [1000, 1000]
  end

  def extension_allowlist
    [:jpg, :jpeg, :png]
  end
end
