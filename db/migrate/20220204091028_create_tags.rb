class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags, id: :uuid do |t|
      t.string :name
      t.references :book, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_reference :payments, :tag, foreign_key: true, type: :uuid
  end
end
