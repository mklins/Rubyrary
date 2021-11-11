class Group < ApplicationRecord
    has_many :book_groups, dependent: :destroy
    has_many :books, through: :book_groups

    validates :title, presence: true, uniqueness: true
end
