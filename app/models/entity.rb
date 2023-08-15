class Entity < ApplicationRecord
    belongs_to :user
    has_many :groups through :entity_id
    validates :name, presence: true
    validates :amount, presence: true
end