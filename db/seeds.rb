# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do
#   title = Faker::Book.genre
#   Group.create title: title
# end

groups = ["Fantasy", "Science Fiction", "Action & Adventure",
        "Crime/Detective", "Horror", "Historical fiction", "Realistic fiction",
        "Metafiction", "Fairy tale", "Folklore", "Legend", "Classic", "Humor",
        "Narrative nonfiction", "Thriller & Suspense", "Romance",
        "Graphic Novel", "History", "Memoir & Autobiography", "Humanities & Social Sciences"]

groups.each do |group|
    Group.create title: group
end
