# encoding: utf-8

class AbhishekUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
   include CarrierWave::RMagick
   include CarrierWave::MiniMagick
     #include Cloudinary::CarrierWave
 #version :banner, :if => :is_landscape?
 # def is_landscape? picture
 #    image = MiniMagick::Image.open(picture.path)
 #    image[:width] > image[:height]
 #  end

  # Choose what kind of storage to use for this uploader:
  #torage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # def store_dir
  #   'public/my/upload/directory'
  # end

  # def store_dir

  # end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # Crop to 275px, 206px
   # version :thumbnail do
   #     process resize_to_fill: [275, 206]
   # end

   # # crop to 62px, 62px
   # version :mini_tumbnail do
   #     process resize_to_fill: [62, 62]
   # end

   # # crop to 870px, 261px
   version :detail do
       process resize_to_fill: [50, 50]
   end

# version :bright_face do
#     cloudinary_transformation :effect => "brightness:30", :radius => 20,
#         :width => 100, :height => 150, :crop => :thumb, :gravity => :face
#   end

#  cloudinary_transformation :transformation => [
#       {:width => 1000, :height => 1200, :crop => :limit}, 
#       {:overlay => "my_watermark", :width => 30, :gravity => :south_east, 
#        :x => 5, :y => 5}
#     ]  

  # version :rotated do
  #   eager
  #   cloudinary_transformation :transformation => [
  #       {:width => 150, :height => 200, :crop => :fill, :effect => "sepia"}, 
  #       {:angle => 10}
  #     ]
  # end

# version :full do    
#     process :convert => 'jpg'
#     process :custom_crop
#   end  

#   def custom_crop      
#     return :x => model.crop_x, :y => model.crop_y, 
#       :width => model.crop_width, :height => model.crop_height, :crop => :crop      
#   end  
  
  #  version :simple do
  #    process resize_to_fill: [164, 164, :fill]
  #    process :convert => 'jpg'
  #    cloudinary_transformation :quality => 80
  # end

  
 #   version :small_thumb, :from_version => :thumb do
 #     process resize_to_fill: [20, 20]
 #   end
   
 # process :resize_to_fit => [800, ]

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
      %w(jpg jpeg gif png) 
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
