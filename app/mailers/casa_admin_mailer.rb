class CasaAdminMailer < ApplicationMailer
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
    @casa_organization = CasaOrg.find(@user.casa_org_id)
    @subject = "Your account has been deactivated"

    mail(to: @user.email, subject: @subject)
  end

  def account_setup(user)
    @mailer_type = "account_setup"
    @user = user
    @casa_organization = CasaOrg.find(@user.casa_org_id)
    @subject = "Create a password & set up your account"
    @token = @user.generate_password_reset_token
    
    mail(to: @user.email, subject: @subject)
  end
end
