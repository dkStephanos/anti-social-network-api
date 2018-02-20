class Post < ApplicationRecord
	belongs_to :user

  validates :content, presence: true

	has_attached_file \
    :photo,
    styles: { thumb: ['32x32#', 'jpg'] },
    convert_options: {
      all: '-interlace Plane'
    },
    default_url: 'assets/images/default.jpeg'

    validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
