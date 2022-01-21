class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites, id: :uuid do |t|
      t.string :inviter
      t.string :invitee
      t.string :key
      t.string :token
      t.references :book, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
