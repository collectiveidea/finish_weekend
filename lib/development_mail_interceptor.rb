class DevelopmentMailInterceptor  
  def self.delivering_email(message)  
    message.subject = "[#{message.to}] #{message.subject}"  
    message.to = ENV['DEVELOPMENT_EMAIL_ADDRESS'] 
  end  
end 
