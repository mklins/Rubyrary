class Book < ApplicationRecord

    has_one_attached :cover_picture
    
    validates :title, presence: true, length: { minimum: 2 }
    validates :body, presence: true, length: { minimum: 2 }
end
