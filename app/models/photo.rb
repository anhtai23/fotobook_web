class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :image, presence: true
  validates_integrity_of :image
  belongs_to :photoable, polymorphic: true, optional: true

  paginates_per 6

end
