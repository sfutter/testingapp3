ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "codingpractice2@gmail.com",
  :password             => "Blackburn2",
  :authentication       => :plain,
  :enable_starttls_auto => true
}
