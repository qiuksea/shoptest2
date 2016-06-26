class ProductPicture < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
                    styles: {large: "200x200>", medium: "100x100>", thumb: "50x50>" }#,
  validates_attachment :image,
                       presence: true,
                       size: { in: 0..10.megabytes },
                       content_type: { content_type:  /\Aimage\/.*\Z/ }
end
