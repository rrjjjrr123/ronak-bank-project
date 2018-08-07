# this is otp mail
class OtpMailer < ApplicationMailer
  default from: 'admin@gmail.com'

  def otp_email(user)
    @user = user
    mail(to: @user.email, subject: 'OTP verification')
  end
end
