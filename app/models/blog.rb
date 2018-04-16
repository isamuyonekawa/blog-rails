class Blog < ApplicationRecord
    validates :title, presence: true, length: { in: 1..19 }
    validates :content, presence: true, length: { in: 1..140 }

    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end
