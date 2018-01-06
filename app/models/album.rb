class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true
  validate :studio_not_nil

  belongs_to :band

  def studio_not_nil
    errors.add(:studio, "must be selected") if studio.nil?
  end
end
