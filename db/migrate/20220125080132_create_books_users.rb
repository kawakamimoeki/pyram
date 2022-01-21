class CreateBooksUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :books_users, id: false do |t|
      t.belongs_to :book, type: :uuid
      t.belongs_to :user, type: :uuid

      t.timestamps
    end
  end
end
