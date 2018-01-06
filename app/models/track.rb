class Track < ApplicationRecord
  validates :title, :ord, :album_id, presence: true
  validate :regular_not_nil

  belongs_to :album

  has_one :band,
  through: :album,
  source: :band

  def regular_not_nil
    errors.add(:regular, "must be selected")
  end
end
