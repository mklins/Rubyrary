class Book < ApplicationRecord

    has_one_attached :cover, dependent: :destroy
    belongs_to :user
    has_many :book_groups, dependent: :destroy
    has_many :groups, through: :book_groups
    
    validates :title, presence: true, length: { minimum: 2 }
    validates :body, presence: true, length: { minimum: 2 }
    validates :cover, presence: true

    scope :all_by_groups, ->(groups) do
        books = includes(:user)
        if groups
            books = books.joins(:groups).where(groups: groups).preload(:groups)
        else
            books = books.includes(:book_groups, :groups)
        end

        books.order(created_at: :desc)
    end
end
