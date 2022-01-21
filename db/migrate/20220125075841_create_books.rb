class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :name

      t.timestamps
    end

    add_reference :expenses, :book, foreign_key: true, type: :uuid
  end
end
