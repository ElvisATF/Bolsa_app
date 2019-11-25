class Offer < ApplicationRecord
  belongs_to :user_entity
  default_scope -> { order(created_at: :desc) }
  validates :user_entity_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
