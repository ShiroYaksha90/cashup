class Group < ApplicationRecord
    belongs_to :user, through: :author_id
    has_many :entities, through: :group_id
    validates :name, presence: true
    validates :icon, presence: true
end