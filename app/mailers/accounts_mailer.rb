class AccountsMailer < ActionMailer::Base
  default from: "notification@financiamientoclimatico.mx"

  def new_account_notification(resource, token)
    @resource = resource
    @token = token
    mail to: resource.email
  end
end