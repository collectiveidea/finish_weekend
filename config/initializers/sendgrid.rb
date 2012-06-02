ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_PASSWORD'],
  :password => ENV['SENDGRID_PASSWORD'],
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
if Rails.env.development?
  require Rails.root.join("lib","development_mail_interceptor")
  Mail.register_interceptor(DevelopmentMailInterceptor)
end
