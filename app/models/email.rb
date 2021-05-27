class Email < ApplicationRecord
    MAILER_TYPES = {
        other: 0, 
        account_setup: 1, 
        deactivation: 2, 
        weekly_digest: 3, 
        court_report_reminder: 4
    }

    enum mailer_type: MAILER_TYPES

    validates :mailer_type, presence: true
    validates :sent_address, presence: true

    belongs_to :sent_to, class_name: "User", foreign_key: "user_id"
end

# == Schema Information
#
# Table name: emails
#
#  id           :bigint           not null, primary key
#  mailer_type  :integer
#  sent_address :string
#  subject      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#
# Indexes
#
#  index_emails_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
