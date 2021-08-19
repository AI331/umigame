class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user,             null: false, foreign_key: true 
      t.references :room,             null: false, foreign_key: true 
      t.references :message,          null: false, foregin_key: true
      t.text       :comment,          null: false
      t.timestamps
    end
  end
end