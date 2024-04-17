class Article < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :tags

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
