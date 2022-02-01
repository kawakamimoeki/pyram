class CreateTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :types, id: :uuid do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end

    add_reference :expenses, :type, foreign_key: true, type: :uuid
  end
end
