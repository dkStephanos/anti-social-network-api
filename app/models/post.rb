class Post < ApplicationRecord
	belongs_to :user

  validates :content, presence: true

  attr_accessor :photo

  mount_base64_uploader :picture, PictureUploader

	has_attached_file \
    :photo,
    styles: { thumb: ['32x32#', 'jpg'] },
    convert_options: {
      all: '-interlace Plane'
    },
    default_url: 'assets/images/default.jpeg',
    validate_media_type: false


    def decode_photo_data photo, photo_name
      signature = Paperclip.io_adapters.for(photo)
      byebug
      base_name = File.basename(photo_name,File.extname(photo_name))
      signature.original_filename = "#{base_name}.jpg"
      self.photo = signature
    end

end
