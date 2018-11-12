class Listing < ApplicationRecord
  include Filterable

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  
  scope :bedrooms, -> (number){where('bedrooms = ?', number)}

  mount_uploaders :pictures, AvatarUploader


  def self.tagged_with(name)
    Tag.find_by!(name: name).listings
  end
  
  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
