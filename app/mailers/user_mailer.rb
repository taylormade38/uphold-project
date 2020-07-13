class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user] #instance variable - available in view
    @greeting = "Hi"

    mail(to: @user.email, subject: 'Thanks For Joining Project UpHold! ✊🏽')
  end
end
