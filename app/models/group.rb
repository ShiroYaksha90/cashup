class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :entities

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
