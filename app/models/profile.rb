class Profile < ApplicationRecord
  belongs_to :user
  has_one :profile, dependent: :destroy
end
