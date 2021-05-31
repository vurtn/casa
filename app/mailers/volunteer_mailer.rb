class VolunteerMailer < ApplicationMailer
  after_action { 
    Email.create(
      sent_to: @user, 
      sent_address: @user.email, 
      mailer_type: @mailer_type, 
      subject: @subject
    ) 
  }

  def deactivation(user)
    @mailer_type = "deactivation"
    @user = user
    @casa_organization = user.casa_org
    @subject = "Your account has been deactivated"

    mail(to: @user.email, subject: @subject)
  end

  def account_setup(user)
    @mailer_type = "account_setup"
    @user = user
    @casa_organization = user.casa_org
    @subject = "Create a password & set up your account"
    @token = @user.generate_password_reset_token

    mail(to: @user.email, subject: @subject)
  end

  def court_report_reminder(user, court_report_due_date)
    @mailer_type = "court_report_reminder"
    @user = user
    @casa_organization = user.casa_org
    @court_report_due_date = court_report_due_date
    @subject = "Your court report is due on: #{court_report_due_date}"

    mail(to: @user.email, subject: @subject)
  end
end
