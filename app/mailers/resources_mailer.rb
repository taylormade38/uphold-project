class ResourcesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.resources_mailer.resources.subject
  #
  def resources
     @report = params[:user] #instance variable - available in view
     binding.pry
    mail(to: @report.user.email, subject: 'Here Are Some Available Resources In Your Community 🙌🏽')
  end
end
