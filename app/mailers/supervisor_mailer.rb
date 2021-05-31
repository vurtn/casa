class SupervisorMailer < ApplicationMailer
  after_action { 
    Email.create(
      sent_to: @supervisor, 
      sent_address: @supervisor.email, 
      mailer_type: @mailer_type, 
      subject: @subject
    ) 
  }

  def deactivation(supervisor)
    @mailer_type = "deactivation"
    @supervisor = supervisor
    @casa_organization = supervisor.casa_org
    @subject = "Your account has been deactivated"
    
    mail(to: @supervisor.email, subject: @subject)
  end

  def account_setup(supervisor)
    @mailer_type = "account_setup"
    @supervisor = supervisor
    @casa_organization = supervisor.casa_org
    @subject = "Create a password & set up your account"
    @token = @supervisor.generate_password_reset_token

    mail(to: @supervisor.email, subject: @subject)
  end

  def weekly_digest(supervisor)
    @mailer_type = "weekly_digest"
    @supervisor = supervisor
    @casa_organization = supervisor.casa_org
    @subject = "Weekly summary of volunteers' activities for the week of #{Date.today - 7.days}"

    mail(to: @supervisor.email, subject: @subject)
  end
end
