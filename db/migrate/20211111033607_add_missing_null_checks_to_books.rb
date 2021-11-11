class AddMissingNullChecksToBooks < ActiveRecord::Migration[6.1]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :body, false
  end
end
