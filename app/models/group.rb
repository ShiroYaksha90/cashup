class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :entities

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true

  def self.total_amount(user)
    total_amount = 0
    @groups = Group.where(author_id: user) || []
    @groups.each do |group|
      amount = group.entities.sum(:amount)
      total_amount += amount
    end
    total_amount
  end
end
