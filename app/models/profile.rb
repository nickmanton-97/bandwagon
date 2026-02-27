class Profile < ApplicationRecord
  belongs_to :user

  has_one_attached :profile_picture

  enum :profile_colour, { red: 0, blue: 1, green: 2, yellow: 3, purple: 4 }
  enum :commitment_level, { hobbyist: 0, serious: 1 }

  # Optional: validations for picture size/type
  validate :acceptable_profile_picture

  def acceptable_profile_picture
    return unless profile_picture.attached?

    unless profile_picture.byte_size <= 3.megabytes
      errors.add(:profile_picture, "is too big (max 3MB)")
    end

    acceptable_types = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(profile_picture.content_type)
      errors.add(:profile_picture, "must be a JPEG or PNG image")
    end
  end
end
