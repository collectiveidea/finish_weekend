class RegistrationMailer < ActionMailer::Base
  include SendGrid
  sendgrid_category :use_subject_lines

  default from: "finishweekend@collectiveidea.com"

  def generate_receipt(event, registration)
    @event = event
    @registration = registration
    mail(:to => registration.email, :subject => "Thanks for Registering!")
  end
end
