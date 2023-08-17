class Bookmark < ApplicationRecord
  # A bookmark belongs to a movie
  # A bookmark belongs to a list
  belongs_to :list
  belongs_to :movie

  # A bookmark must be linked to a movie and a list,
  # and the [movie, list] pairings should be unique.
  validates :movie, :list, presence: true
  validates :movie, uniqueness: { scope: :list }

  # The comment of a bookmark cannot be shorter than 6 characters.
  validates :comment, length: { minimum: 6 }
end
