ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_PASSWORD'],
  :password => ENV['SENDGRID_PASSWORD'],
  :address => "smtp.sendgrid.net",
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
