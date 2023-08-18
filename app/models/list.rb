class List < ApplicationRecord
  has_one_attached :photo
  # A list has many bookmarks
  # When you delete a list, you should delete all associated bookmarks
  has_many :bookmarks, dependent: :delete_all

  # A list has many movies through bookmarks
  has_many :movies, through: :bookmarks

  # A list must have a unique name.
  validates :name, presence: true
  validates :name, uniqueness: true
end
