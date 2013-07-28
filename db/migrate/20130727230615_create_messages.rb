class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.integer :user_id
      t.string :receiver_email

      t.timestamps
    end
  end
end
