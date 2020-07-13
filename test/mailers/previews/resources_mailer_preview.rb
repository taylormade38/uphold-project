# Preview all emails at http://localhost:3000/rails/mailers/resources_mailer
class ResourcesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/resources_mailer/resources
  def resources
    ResourcesMailer.resources
  end

end
