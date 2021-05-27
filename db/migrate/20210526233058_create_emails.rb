class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :mailer_type
      t.string :sent_address
      t.string :subject

      t.timestamps
    end
  end
end
