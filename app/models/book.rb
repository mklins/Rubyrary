class Book < ApplicationRecord

    has_one_attached :cover, dependent: :destroy
    
    validates :title, presence: true, length: { minimum: 2 }
    validates :body, presence: true, length: { minimum: 2 }
    validates :cover, presence: true
end
