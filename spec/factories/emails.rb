FactoryBot.define do
  factory :email do
    mailer_type { 1 }
    sent_address { "MyString" }
    subject { "MyString" }
  end
end
