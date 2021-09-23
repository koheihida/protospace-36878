class Prototype < ApplicationRecord

  validates :catch_copy,       presence: true
  validates :title,       presence: true
  validates :concept,       presence: true
  validates :image,       presence: true, unless: :was_attached?

  has_many :comments, dependent: :destroy
  belongs_to :user
  
  has_one_attached :image



  def was_attached?
    self.image.attached?
  end
end
