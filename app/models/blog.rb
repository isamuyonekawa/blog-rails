class Blog < ApplicationRecord
    validates :title, presence: true, length: { in: 1..19 }
    validates :content, presence: true, length: { in: 1..140 }
end
