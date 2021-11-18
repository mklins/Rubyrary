# frozen_string_literal: true

class Book < ApplicationRecord
  has_one_attached :cover, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :authors
  has_many :book_groups, dependent: :destroy
  has_many :groups, through: :book_groups

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }
  validates :cover, presence: true

  scope :all_by_groups, lambda { |group_ids|
    books = includes(:user, :book_groups, :groups)
    books = books.joins(:groups).where(groups: group_ids) if group_ids
    books.order(created_at: :desc)
  }
end
