class CreateBookGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :book_groups do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end

    add_index :book_groups, [:book_id, :group_id], unique: true
  end
end
